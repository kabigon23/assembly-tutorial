;
%include "io64.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 1, x
    GET_DEC 1, y
    
    PRINT_STRING msg1
    PRINT_DEC 1, x
    NEWLINE
    
    PRINT_STRING msg2
    PRINT_DEC 1, y
    NEWLINE
    
    ;x+y
    mov al, [x]
    mov bl, [y]
    add al, bl
    mov [a], al
    
    ;x-y
    mov al, [x]
    sub al, bl
    mov [s], al
    
    ;x*y
    mov ax, 0
    mov al, [x]
    mul bl
    mov [m], ax
    
    ;x/y
    mov ax, 0
    mov al, [x]
    div bl
    mov [d], al
    mov [r], ah
    
    PRINT_DEC 1, a
    NEWLINE
    PRINT_DEC 1, s
    NEWLINE
    PRINT_DEC 2, m
    NEWLINE
    PRINT_DEC 1, d
    NEWLINE
    PRINT_DEC 1, r
    NEWLINE
        
    xor rax, rax
    ret
    
section .text
    msg1 db "Input number 1: ",0x00
    msg2 db "Input number 2: ",0x00

section .bss
    x resb 1
    y resb 1
    a resb 1
    s resw 1
    m resw 2
    d resw 1
    r resw 1
    
