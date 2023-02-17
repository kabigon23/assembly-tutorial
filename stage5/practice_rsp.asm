;Practice stack
%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    
    GET_DEC 2, a
    GET_DEC 2, b
    push word [a]
    push word [b]
    call FUNC
    add rsp, 4
    mov [c], ax
    PRINT_DEC 2, c
    NEWLINE
    
    xor rax, rax
    ret    
FUNC:
    push rbp
    mov rbp, rsp
    mov ax, [rbp+8+8+2]
    mov bx, [rbp+8+8]
    add ax, bx
    pop rbp
    ret        
    
section .bss
    a resw 1
    b resw 1
    c resw 1
