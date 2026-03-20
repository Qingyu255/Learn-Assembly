# Task: Sum absolute values until the running sum reaches greater than or equals to 15

.intel_syntax noprefix
.section .data
arr: .quad 4, -3, 2, -6, 7
.section .text
.global _start

_start:
	# let r8 be the register storing our running sum
	# let r10 be the register storing the index

	# they have to be 0 so: zero out the registers that we are using with xor
	xor r8, r8
	xor r10, r10

loop_start:
	# let r9 be the register holding the value to be added to the running sum, r8
	mov r9, QWORD PTR [arr + r10 * 8]
	cmp r9, 0
	jl handle_negative

add_positive:
	add r8, r9
	cmp r8, 15
	jge done
	
	jmp loop_start

handle_negative:
	imul r9, -1
	jmp add_positive

done:
	int3
