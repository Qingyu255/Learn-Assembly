.intel_syntax noprefix
.section .data
y: .short  0x1234
x: .quad 0x1122334455667788

.section .text
.global _start
_start:
	int3
