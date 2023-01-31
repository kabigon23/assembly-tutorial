%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    PRINT_STRING msg1
    NEWLINE

    xor rax, rax
    ret

section .data
    msg1 db "Hello world",0x00