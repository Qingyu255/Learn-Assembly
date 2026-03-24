.intel_syntax noprefix
.section .text
.global _start
_start:
    mov rax, 0

    test rax, rax
    je is_zero

    mov r8, 0
    jmp done

is_zero:
    mov r8, 1

done:
    int3
