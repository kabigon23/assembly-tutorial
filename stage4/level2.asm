;Store the multiples of 3 from 1 to the input value in an array and add all the array values
%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    PRINT_STRING msg_input
    NEWLINE
    
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
    xor eax, eax
    xor edx, edx
    PRINT_STRING msg_mulof3
    NEWLINE
L4:    
    xor ebx, ebx
    mov bx, [data+eax*2]
    add [total], bx
    
    PRINT_DEC 2, bx
    PRINT_STRING msg_space
    
    inc ax
    cmp ax, [data_size]
    jl L4
    NEWLINE
    PRINT_STRING msg_line
    NEWLINE
    PRINT_STRING msg_cnt
    PRINT_DEC 2, data_size
    NEWLINE
    PRINT_STRING msg_total
    PRINT_DEC 2, total
    NEWLINE
    
    xor rax, rax
    ret
section .data
    msg_space db ' ', 0x00
    msg_input db 'Input number: ', 0x00
    msg_mulof3 db '----------Multiples of 3 list----------', 0x00
    msg_line db '-----------------------------------------------', 0x00
    msg_cnt db 'Count of multiples of 3: ', 0x00
    msg_total db 'Total: ', 0x00

section .bss
    data_max resw 1
    data_size resw 1
    data resw 100
    total resw 1
