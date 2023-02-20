section .text
global main
main:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 80h

    ret
section .data
    msg db "Hello world", 0x00
    msg_len equ $-msg
