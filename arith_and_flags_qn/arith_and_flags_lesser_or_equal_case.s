# Task: Write a program that compares rax and rbx, branches if lesser than or equal, and sets r8 to either 1 or 0.

.intel_syntax noprefix
.section .text
.global _start

_start:
	mov rax, 254
	mov rbx, 255
	cmp rax, rbx
	# since rax - rbx may be negative, we need to use signed jumps
	# recall: signed --> l/g unsigned --> a/b
	jle le_case
	
	# code flows here if rax != rbx
	mov r8, 0
	jmp done # jump to done so that we dont fall through to the equal_case block

le_case:
	mov r8, 1

done:
	int3
