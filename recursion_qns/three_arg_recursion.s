#Task: Write a recursive function with 3 args that keeps shifting arguments around, just so you can practice frame layout.
.intel_syntax noprefix
.section .text
.global _start
.global demo3

demo3:
    push rbp
    mov rbp, rsp
    sub rsp, 24

    mov QWORD PTR [rbp-8], rdi
    mov QWORD PTR [rbp-16], rsi
    mov QWORD PTR [rbp-24], rdx

    cmp QWORD PTR [rbp-8], 0
    jg recurse

    mov rax, QWORD PTR [rbp-24]
    jmp done

recurse:
    mov rax, QWORD PTR [rbp-8]
    lea rdi, [rax-1]

    mov rbx, QWORD PTR [rbp-16]
    mov rcx, QWORD PTR [rbp-24]

    add rcx, rbx
    mov rsi, rcx
    mov rdx, rbx
    call demo3

done:
    mov rsp, rbp
    pop rbp
    ret

_start:
    mov rdi, 2
    mov rsi, 3
    mov rdx, 5
    call demo3
    int3

