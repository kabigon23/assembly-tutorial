%include "io64.inc"
;Input a, b and c then output max*min
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;Input a, b, c
    GET_DEC 2, a
    GET_DEC 2, b
    GET_DEC 2, c
    
    ;ax=max
    mov ax, [a]    
    cmp ax, [b]
    jle MAX_B
    jmp MAX_B_END

MAX_B:
    mov ax, [b]        
        
MAX_B_END:
    cmp ax, [c]
    jle MAX_C
    jmp MAX_C_END
    
MAX_C:
    mov ax, [c]
    
MAX_C_END:
    mov [max], ax
    
    ;ax=min
    mov ax, [a]
    cmp ax, [b]
    jge MIN_B
    jmp MIN_B_END
    
MIN_B:
    mov ax, [b]

MIN_B_END:
    cmp ax, [c]
    jge MIN_C
    jmp MIN_C_END
        
MIN_C:
    mov ax, [c]    
    
MIN_C_END:
    mov [min], ax
    
    PRINT_DEC 2, max
    NEWLINE
    PRINT_DEC 2, min
    NEWLINE
    
    ;max*min
    xor eax, eax
    mov ax, [max]
    mov bx, [min]
    mul bx
    shl edx, 16
    or eax, edx
    mov [total], eax
    
    PRINT_DEC 4, total
    NEWLINE
          
    xor rax, rax
    ret

section .bss
    a resw 1
    b resw 1
    c resw 1
    max resw 1
    min resw 1
    total resd 1