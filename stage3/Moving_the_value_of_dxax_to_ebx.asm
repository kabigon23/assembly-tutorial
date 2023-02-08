;Moving the value of dxax to ebx
%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 0x12345678
    mov edx, eax
    and eax, 0x0000ffff
    and edx, 0xffff0000
    or eax, edx
    mov ebx, eax
    
    PRINT_HEX 4, ebx
    NEWLINE
    
    xor rax, rax
    ret

