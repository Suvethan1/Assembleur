global _start

section .data
number dd '1337',0

section .bss
add resb 3

section .text

_start:
mov eax, 0
mov edi, 0
mov rsi, add
mov edx, 3
syscall

mov al, [add]
cmp al, 0x34
jne n_e

mov al, [add + 1]
cmp al, 0x32
jne n_e


mov al, [add + 2]
cmp al, 0x0A
jne n_e

mov rax, 1
mov rdi, 1
mov rsi, number
mov rdx, 4
syscall

mov rax, 60
mov rdi, 0
syscall

n_e:
mov rax, 60
mov rdi, 1
syscall