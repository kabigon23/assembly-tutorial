%include "io.inc"

extern inimylib
extern get_number

section .text
global main
main:
    xor eax, eax
    call inimylib
    mov [cnt], dword 0
    mov [check_cnt], dword 0
    PRINT_STRING msg_lotto
GET_NUM:
    call get_number
    cmp dword [cnt], 0
    je GO
    mov ecx, dword [cnt]
CHECK:
    mov [res], byte 0
    push dword [data+4*(ecx-1)]
    push eax
    call CHECKSAME
    add esp, 8
    cmp byte [res], 1
    je GET_NUM
    loop CHECK
GO:    
    mov edx, dword [cnt]
    mov [data+4*edx], eax
    PRINT_DEC 4, eax
    PRINT_STRING msg_space
    inc dword [cnt]
    cmp dword [cnt], 6
    jne GET_NUM
    NEWLINE
 
    xor eax, eax
    ret    
CHECKSAME:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp+8]
    cmp eax, dword [ebp+12]
    jne NOTSAME
SAME:
    mov [res], byte 1
    pop ebp
    ret
NOTSAME:
    mov [res], byte 0
    pop ebp
    ret
        
section .data
    msg_lotto db "Lotto: ", 0x00
    msg_space db " ", 0x00
section .bss
    data resd 6
    cnt resd 1
    check_cnt resd 1
    res resb 1
