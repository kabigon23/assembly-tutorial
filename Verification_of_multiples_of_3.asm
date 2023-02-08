;Verification of multiples of 3
%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 2, a ;Input natural number
    mov ax, [a]
    mov bl, 3
    div bl
    
    cmp ah, 0
    je TRUE
    PRINT_STRING msg_false
    jmp TRUE_END
TRUE:
    PRINT_STRING msg_true
TRUE_END:    
    xor rax, rax
    ret
section .text
    msg_input db "Input number: ", 0x00
    msg_true db "This number is multiples of 3", 0x00
    msg_false db "This number is not multiples of 3", 0x00    
section .bss
    a resw 1
