global _main

section .text
_main:
    mov rsi, qword message
    mov rdx, message.len
    call print 

    mov rcx, 1
    call fizzloop

    jmp exit 

exit:
    mov rdi, rax
    mov rax, 0x2000001
    syscall

print:
    mov rax, 0x2000004
    mov rdi, 1
    syscall
    ret

fizzloop:
    push rcx
    mov edx, 0
    push rcx
    mov rax, rcx
    mov ecx, 0xF
    div ecx
    cmp edx, 0
    pop rcx
    jz printfb

    mov edx, 0
    push rcx
    mov rax, rcx
    mov ecx, 0x3
    div ecx
    cmp edx, 0
    pop rcx
    jz printfizz

    mov edx, 0
    push rcx
    mov rax, rcx
    mov ecx, 0x5
    div ecx
    cmp edx, 0
    pop rcx
    jz printbuzz

    jmp else

printfizz:
    push rdx
    mov rsi, qword fizz
    mov rdx, fizz.len
    call print
    pop rdx
    jmp else

printbuzz:
    push rdx
    mov rsi, qword buzz 
    mov rdx, buzz.len
    call print
    pop rdx
    jmp else

printfb:
    push rdx
    mov rsi, qword fizzbuzz
    mov rdx, fizzbuzz.len
    call print
    pop rdx
    jmp else

else:
    pop rcx
    inc rcx
    cmp rcx, loopmax
    jl fizzloop
    ret

section .data
    message: db "Hello, world!", 10
    .len: equ $ - message

    fizz: db "fizz", 10
    .len: equ $ - fizz

    buzz: db "buzz", 10
    .len: equ $ - buzz 

    fizzbuzz: db "fizzbuzz", 10
    .len: equ $ - fizzbuzz

    loopmax: equ 1000
