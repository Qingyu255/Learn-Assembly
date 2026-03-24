.intel_syntax noprefix
.section .text
.global _start

_start:
        # TASK: push 2 values, pop them back and inspect the results
        mov rax, 0x1111
        mov rbx, 255

        # know that stack grows downwards in memory; elements at the top of the stack have a smaller addr
	# ess than elements at the bottom of the stack
        # the rsp points to the current top of the stack
        # each push decrements rsp by 8 but pop increments rsp by 8
        # example:
        # push rax: take the 64-bit value in rax and pushes it onto the stack. internally: rsp -= 8

        # pop r8
        # take the 64-bit value currently at the tp of the stack, store it at r8, remoce it from stack an
	# d increment rsp: rsp += 8 


        push rax
        push rbx

	pop r8
	pop r9

	int3
