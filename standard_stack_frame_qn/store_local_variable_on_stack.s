.intel_syntax noprefix
.section .text
.global _start

plus1_local:
	# %rbp (Register Base Pointer) is a special-purpose register used primarily as a frame pointer to manage a function's stack frame. It points to the base of the current stack frame, providing a stable re    	# ference point for accessing local variables and function parameters
	# IMPT: know how to write the function prologue:
	
	push rbp # This saves the caller's old frame pointer
	mov rbp, rsp # This makes rbp the base of the current function's frame
	sub rsp, 8 # This reserves 8 bytes for local storage; understand that this works as stack grows d			# downwards in our architecture
	
	# KEY!: After sub rsp, 8, the reserved local slot is the address range from the new rsp up to the old rsp - 1.
	# KEY!: When you store a QWORD there, the 8 bytes occupy that whole range, and because x86 is little-endian, the LSB goes at the lowest address.
	
	mov QWORD PTR [rbp - 8], rdi
	mov rax, QWORD PTR [rbp - 8]
	add rax, 1

	# IMPT: Know how to write the matching function epilogue: to undo the stack-frame setup and
	# return to the caller
	mov rsp, rbp # set the stack pointer back to the base of this function’s stack frame; discards the local space and resets the stack top to where the saved old rbp lives. This is done by moving the rsp back to a higher address
	pop rbp # restore the caller’s old rbp
	ret # go back to caller; read 8 byte value at rsp as an instruction address, jump there and rsp += 8
	
_start:
	mov rdi, 41
	call plus1_local
	int3
	
