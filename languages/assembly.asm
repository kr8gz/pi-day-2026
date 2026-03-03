section .data
a       dq 1.0
b       dq 0.70710678118    ; 1/sqrt(2)
p       dq 1.0
t       dq 0.25
two     dq 2.0
four    dq 4.0
ten     dq 10.0
new_a   dq 0.0
new_b   dq 0.0
new_p   dq 0.0
new_t   dq 0.0
pi      dq 0.0
scale   dq 1000000000000.0

section .bss
buf resb 32
bufend equ buf + 32

section .text
global _start

_start:
    mov rcx, 10             ; iterations

loop_start:
    ; an+1 = (a+b)/2
    fld qword [a]
    fld qword [b]           ; st0 = b, st1 = a
    faddp st1, st0          ; st0 = a + b
    fdiv qword [two]        ; st0 = (a + b) / 2
    fstp qword [new_a]

    ; bn+1 = sqrt(a*b)
    fld qword [a]
    fld qword [b]           ; st0 = b, st1 = a
    fmulp st1, st0          ; st0 = a * b
    fsqrt                   ; st0 = sqrt(a * b)
    fstp qword [new_b]

    ; tn+1 = t - p * (a - an+1) ** 2
    fld qword [a]           ; st0 = a
    fsub qword [new_a]      ; st0 = a - an+1
    fmul st0, st0           ; st0 = (a - an+1)^2
    fmul qword [p]          ; st0 = p * (a - an+1)^2
    fld qword [t]           ; st0 = t, st1 = p * (a - an+1)^2
    fsubrp st1, st0         ; st0 = t - p * (a - an+1)^2
    fstp qword [new_t]

    ; pn+1 = 2 * p = p + p
    fld qword [p]           ; st0 = p
    fadd st0, st0           ; st0 = 2 * p
    fstp qword [new_p]

    fld qword [new_a]
    fstp qword [a]
    fld qword [new_b]
    fstp qword [b]
    fld qword [new_p]
    fstp qword [p]
    fld qword [new_t]
    fstp qword [t]

    dec rcx
    jnz loop_start

    ; pi = (a + b) ** 2 / (4 * t)
    fld qword [a]
    fld qword [b]           ; st0 = b, st1 = a
    fadd st0, st1           ; st0 = a + b
    fmul st0, st0           ; st0 = (a + b) ** 2
    fld qword [t]           ; st0 = t, st1 = (a + b) ** 2
    fmul qword [four]       ; st0 = 4 * t, st1 = (a + b) ** 2
    fdivr st0, st1          ; st0 = (a + b) ** 2 / (4 * t)
    fstp qword [pi]

    fld qword [pi]
    fmul qword [scale]
    fistp qword [pi]

    mov rax, [pi]
    mov rdi, bufend
    mov rcx, 13
    mov rbx, 10

    dec rdi
    mov byte [rdi], 0x0a

convert_to_decimal:
    xor rdx, rdx
    div rbx
    dec rdi
    add dl, '0'
    mov [rdi], dl

    dec rcx
    cmp rcx, 1
    jne convert_to_decimal

    dec rdi
    mov byte [rdi], '.'

    xor rdx, rdx
    div rbx
    dec rdi
    add dl, '0'
    mov [rdi], dl

    mov rax, 1
    mov rsi, rdi
    mov rdx, bufend
    sub rdx, rdi
    mov rdi, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall