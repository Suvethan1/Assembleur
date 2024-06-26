;SUTHAKAR Suvethan
global _start

section .data

section .bss
    input resb 11

section .text
_start:
    mov eax, 0
    mov edi, 0
    mov rsi, input
    mov edx, 11
    syscall

    mov rdi, input
    add rdi, 10

_dernier:
    cmp byte [rdi], 0x30
    jb _verif
    cmp byte [rdi], 0x39
    ja _verif
    jmp _result           

_verif:
    dec rdi                       
    jmp _dernier

_result:
    movzx eax, byte [rdi]         
    sub eax, '0'                  

    and eax, 1                    
    jnz _impaire                    

    mov rax, 60
    mov rdi, 0
    syscall

_impaire:
    mov rax, 60
    mov rdi, 1
    syscall