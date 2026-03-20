# Task: Write a program that compares rax and rbx, branches if greater than, and sets r8 to either 1 or 0.

.intel_syntax noprefix
.section .text
.global _start

_start:
	mov rax, 255
	mov rbx, 252
	cmp rax, rbx
	# since rax - rbx may be negative, we need to use signed jumps
	# recall: signed --> l/g unsigned --> a/b
	jg g_case
	
	# code flows here if rax != rbx
	mov r8, 0
	jmp done # jump to done so that we dont fall through to the equal_case block

g_case:
	mov r8, 1

done:
	int3
