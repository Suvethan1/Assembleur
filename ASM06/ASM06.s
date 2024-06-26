global _debut

section .data
    msg db 'Entrez un nombre: ', 0xA

section .bss
    num resb 32

section .text

_debut:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 17
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, num
    mov rdx, 32
    syscall

    sub rax, 1
    mov rcx, rax
    lea rsi, [num]

    xor rdi, rdi

convertir_decimal:
    xor rax, rax
    movzx rax, byte [rsi]
    sub rax, '0'
    cmp rax, 10
    jae verifier_premier
    imul rdi, rdi, 10
    add rdi, rax
    inc rsi
    loop convertir_decimal

verifier_premier:
    cmp rdi, 2
    jb non_premier
    je premier
    mov rcx, rdi
    shr rcx, 1
    mov rsi, 2

test_premier:
    mov rax, rdi
    xor rdx, rdx
    div rsi
    cmp rdx, 0
    je non_premier
    inc rsi
    cmp rsi, rcx
    jbe test_premier

premier:
    mov rax, 60 
    mov rdi, 0
    syscall

non_premier:
    mov rax, 60
    mov rdi, 1
    syscall
