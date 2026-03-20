# Task: Write a program that compares rax and rbx, branches if equal, and sets r8 to either 1 or 0.

.intel_syntax noprefix
.section .text
.global _start

_start:
	mov rax, 255
	mov rbx, 255
	cmp rax, rbx
	je equal_case
	
	# code flows here if rax != rbx
	mov r8, 0
	jmp done # jump to done so that we dont fall through to the equal_case block

equal_case:
	mov r8, 1

done:
	int3
