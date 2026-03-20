S210 x86 Assembly Quick Setup

## Environment

* **Target:** Linux **x86-64**
* Use **64-bit registers** like `rax`, `r8`, `rsp`, `rbp`

## Syntax

Add this at the top of your file:

```asm
.intel_syntax noprefix
```

This means:

* registers are written as `rax` instead of `%rax`
* immediates are written as `5` instead of `$5`

## Sections

* `.section .data` → variables / stored values
* `.section .text` → instructions

## Entry point

Use:

```asm
.global _start
_start:
```

## Labels

Labels end with `:` and represent addresses:

```asm
loop:
data:
```

## Memory operands

Use square brackets for memory access:

```asm
mov r9, QWORD PTR [arr + r10*8]
```

## Size keywords

* `BYTE PTR` = 1 byte
* `WORD PTR` = 2 bytes
* `DWORD PTR` = 4 bytes
* `QWORD PTR` = 8 bytes

## Data directives

* `.byte` = 1 byte
* `.short` = 2 bytes
* `.long` = 4 bytes
* `.quad` = 8 bytes

## Build

```bash
as -o prog.o prog.S
ld -o prog prog.o
```

## Debug

```bash
gdb ./prog
```

Useful GDB commands:

```gdb
b _start
run
si
c
p/x $rax
x/1gx &x
quit
```

## Minimal template

```asm
.intel_syntax noprefix

.section .data

.section .text
.global _start
_start:
    int3
```

