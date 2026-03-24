#Task: Put the larger of rax and rbx into rcx.

# CMOVcc: conditional mov : cmov<cc> dst, src: if cc then dst=src else do nothing :
cmovg dst, src : dst = src if greater. See flow control instructions for example
conditions

.intel_syntax noprefix
.section .text
.global _start
_start:
    mov rax, 20
    mov rbx, 35

    mov rcx, rax
    cmp rbx, rax
    cmovg rcx, rbx

    int3
