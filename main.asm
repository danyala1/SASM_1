%include "io64.inc"

section .bss
value: resD 4

section .text
global main

main:
    mov rbp, rsp; for correct debugging
    xor rax,rax     
    GET_UDEC 8, rdi     
    mov [value], rdi
    mov rdi, 8654
    mov [value + 4], rdi
    mov rdi, 1566
    mov [value + 8], rdi
    mov rdi, 5678
    mov [value + 12], rdi
                     
                     
    mov r8, 100 
    
    generate_number:
    mov rax, [value]
    mov rbx, [value + 4]
    mov rcx, [value + 8]
    mov rdx, [value + 12]
    
    mov r10, rax
    shl rax, 11
    xor rax, r10
    mov r11, rax
    
    mov rax, rbx
    mov rbx, rcx
    mov rcx, rdx
    
    mov r12, r11
    shr r12, 8
    xor r12, r11
    
    mov r13, rdx
    shr r13, 19
    xor r13, rdx
    
    mov r14, r12
    xor r14, r13
    mov rdx, r14
    
    mov [value], rax
    mov [value + 4], rbx
    mov [value + 8], rcx
    mov [value + 12], rdx
     
    mov rsi, [value + 12]
    PRINT_UDEC 8, rsi
    NEWLINE

    dec r8
    jnz generate_number

    NEWLINE
    PRINT_STRING "END"         
    xor rax, rax            
    ret  