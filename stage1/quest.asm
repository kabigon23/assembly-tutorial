%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;[퀘스트] 데이터 옮기기
    ;write your code here
    mov al, [a]
    mov [e], al
    mov ax, [b]
    mov [f], ax
    mov eax, [c]
    mov [g], eax
    mov rax, [d]
    mov [h], rax
    PRINT_HEX 1, e
    NEWLINE
    PRINT_HEX 2, f
    NEWLINE
    PRINT_HEX 4, g
    NEWLINE
    PRINT_HEX 8, h
    NEWLINE
 
    xor rax, rax
    ret
    
section .data
    a db 0x34
    b dw 0x5678
    c dd 0x11339ABC
    d dq 0x13344DEFF3445123
    
section .bss
    e resb 1
    f resw 1
    g resd 1
    h resq 1
    
