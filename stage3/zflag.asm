%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov ax, 0x1234
    and ax, 0x0000
    
    mov ax, 0x1234
    test ax, 0x0000
    
    xor rax, rax
    ret