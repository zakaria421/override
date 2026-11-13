# Override

Override is a hands-on binary exploitation and reverse-engineering project. It
contains ten progressively structured levels (`level00` through `level09`) that
demonstrate how implementation mistakes and missing security protections can be
analyzed and exploited.

## Project goals

The main goals of this project are to:

- Build practical skills in Linux binary analysis and debugging.
- Learn how to identify vulnerabilities in compiled C programs.
- Understand how data moves through memory, the stack, the heap, and the GOT.
- Practice using tools such as `gdb`, `objdump`, `strings`, `file`, and
  `checksec`.
- Reconstruct program logic from source code and disassembly.
- Develop exploit strategies for authentication bypasses, memory corruption,
  format-string bugs, unsafe file handling, and control-flow hijacking.
- Understand common mitigations, including stack canaries, NX, PIE, and
  runtime tracing.
- Improve technical documentation by recording the reasoning behind each
  solution.

## Levels and concepts

| Level | Main concept |
| --- | --- |
| `level00` | Input validation and basic reverse engineering |
| `level01` | Stack buffer overflow and return-to-libc |
| `level02` | Format-string information disclosure |
| `level03` | Integer logic and XOR-based control flow |
| `level04` | Stack overflow with `ptrace`-based restrictions |
| `level05` | Format-string writes and GOT overwrites |
| `level06` | Reimplementation of a deterministic serial algorithm |
| `level07` | Out-of-bounds array access and return-address control |
| `level08` | Path traversal and unsafe file handling |
| `level09` | Structure corruption, off-by-one overflow, and a backdoor |

## Repository structure

Each level generally contains:

```text
levelXX/
├── source or source.c       # Target source or reconstructed logic
├── walkthrough              # Analysis and solution notes
├── Ressources/              # Optional helpers and supporting material
└── flag                     # Local challenge output; do not publish secrets
```

The walkthroughs explain the relevant vulnerability, the investigation steps,
and the exploit concept used to complete the level. Supporting files are
included where a helper program or script is useful for reproducing the
analysis.

## Recommended workflow

1. Inspect the target with `file`, `strings`, and `checksec`.
2. Read the relevant code or disassemble the binary with `objdump`.
3. Use `gdb` to confirm program behavior and inspect memory.
4. Identify the vulnerability and calculate the required offsets or values.
5. Test the solution in the intended challenge environment.
6. Read the level walkthrough only after attempting your own analysis.

## Requirements

The exercises are intended for a Linux environment and may require:

- GCC and standard C development tools
- `gdb`
- `binutils` (`objdump`, `strings`, and related tools)
- `file`
- `checksec`
- Python for helper scripts

Some levels depend on 32-bit behavior and older runtime layouts. Results such
as addresses and offsets can vary between systems, so the documented values may
need to be recalculated in a matching environment.

## Disclaimer

This project is intended for education and authorized security practice only.
Run the exercises locally or in an environment where you have explicit
permission to test. Do not use these techniques against systems you do not own
or have permission to assess.
