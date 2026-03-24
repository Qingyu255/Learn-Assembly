#TaskK: compute 2^n recursively
.intel_syntax noprefix
.section .text
.global _start

pow2:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov QWORD PTR [rbp-8], rdi

    cmp QWORD PTR [rbp-8], 0
    ja recurse

    mov rax, 1
    jmp done

recurse:
    mov rax, QWORD PTR [rbp-8]
    sub rax, 1
    mov rdi, rax
    call pow2
    add rax, rax

done:
    mov rsp, rbp
    pop rbp
    ret

_start:
        mov rdi, 4
        call pow2
        int3
