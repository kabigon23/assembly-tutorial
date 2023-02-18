%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    PRINT_STRING msg_input
    NEWLINE
    
    GET_DEC 2, a
    xor rax, rax
    mov ax, [a]
    push ax
    call FACT
    pop ax
    
    PRINT_STRING msg_answer
    PRINT_DEC 2, a
    PRINT_STRING msg_colon
    PRINT_DEC 4, sum
    NEWLINE
    
    xor rax, rax
    ret
FACT:
    push rbp
    mov rbp, rsp
    mov bx, [rbp + 16]
FACT_START:
    dec bx
    mul bx
    shl edx, 16
    and eax, 0x0000ffff
    or eax, edx
    cmp bx, 1
    jne FACT_START    
FACT_END:
    mov [sum], eax
    pop rbp
    ret
section .data
    msg_input db "Input number: ", 0x00
    msg_answer db "Factorial of ", 0x00
    msg_colon db ": ", 0x00
section .bss
    a resw 1
    sum resd 1