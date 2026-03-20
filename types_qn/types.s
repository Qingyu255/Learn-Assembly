.intel_syntax noprefix
.section .data

byte_val_1byte: .byte 0x7f
word_val_2byte: .short 0x1234
dword_val_4byte: .long 0x12345678
quad_val_8byte: .quad 0x1122334455667788

.section .text
.global _start

_start:
	mov al, BYTE PTR [byte_val_1byte]
	mov bx, WORD PTR [word_val_2byte]
	mov ecx, DWORD PTR [dword_val_4byte]
	mov r8, QWORD PTR [quad_val_8byte]
	int3
