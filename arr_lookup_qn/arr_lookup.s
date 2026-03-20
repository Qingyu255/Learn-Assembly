.intel_syntax noprefix
	
.section .data
arr: .quad 11, 22, 33, 44, 55 # each .quad is 8 bytes

.section .text
.global _start
_start:
	mov r10, 3 # we can take r10 as the 3rd index, which is 44
	mov r9, QWORD PTR[arr + r10 * 8] # after this line we should see 44 at R9
	int3
