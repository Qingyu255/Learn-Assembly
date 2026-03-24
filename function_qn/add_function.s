# Task: Write a function add2 that returns a+b.

# MUST KNOW: functions' return values in assembly is conventionally the rax register; tho you can always use another register

.intel_syntax noprefix
.section .text
.global _start

add2:
	# this function sums the values in rdi and rsi and stores the sum in rax (convention)
	mov rax, rdi
	add rax, rsi
	ret

_start:
	mov rdi, 8
	mov rsi, 7
	call add2
	int3
