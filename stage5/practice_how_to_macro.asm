;Practice how to macro
%include "io64.inc"

%macro MY_SHOW 2
    PRINT_DEC 2, %1
    NEWLINE
    PRINT_DEC 2, %2
    NEWLINE
%endmacro
%macro MY_ADD 3
    mov ax, [%1]
    mov bx, [%2]
    add ax, bx
    mov [%3], ax
%endmacro    
section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 2,a
    GET_DEC 2,b
    MY_SHOW a,b
    MY_ADD a,b,c
    PRINT_DEC 2, c
    NEWLINE
    xor rax, rax
    ret
section .bss
    a resw 1
    b resw 1
    c resw 1