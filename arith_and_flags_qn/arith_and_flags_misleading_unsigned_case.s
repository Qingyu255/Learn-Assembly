# The CPU treats the register bit pattern 0xFFFFFFFFFFFFFFFF as either -1 (signed) or a huge positive number (unsigned) depending solely on which jump instruction you use. While mov rax, -1 is a convenient way to fill a register with all 1s, using the "Above/Below" jump family (like ja) forces the processor to evaluate the Carry Flag for unsigned logic, where 0xFF... is mathematically greater than 1. In contrast, the "Greater/Less" family (like jg) would check the Sign Flag, interpreting that same bit pattern as a negative value.

.intel_syntax noprefix
.section .text
.global _start

_start:
	mov rax, -1  # bit pattern = 0xffffffffffffffff
	mov rbx, 1
	cmp rax, rbx
	ja unsigned_above
	
	# code flows here if rax != rbx
	mov r8, 0
	jmp done # jump to done so that we dont fall through to the equal_case block

unsigned_above:
	mov r8, 1

done:
	int3
