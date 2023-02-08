;Store the multiples of 3 from 1 to the input value in an array and add all the array values
%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    GET_DEC 2, data_max
    xor eax, eax
    xor edx, edx
    mov dx, 1
    mov [data_size], word 0
L1:    
    mov ax, dx
    mov bl, 3
    div bl
    cmp ah, 0
    jne L3
L2:
    mov ax, [data_size]
    mov [data+eax*2], dx
    inc ax
    mov [data_size], ax    
L3:
    inc dx
    cmp dx, [data_max]
    jle L1
    
    xor rax, rax
    ret

section .bss
    data_max resw 1
    data_size resw 1
    data resw 100
    total resw 1
