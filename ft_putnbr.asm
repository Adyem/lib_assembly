.text
.globl ft_putnbr
.type  ft_putnbr, @function
.extern ft_write
ft_putnbr:
    sub $40, %rsp
    mov %rdi, %rax
    lea 39(%rsp), %rsi
    mov $0, %ecx
    mov $10, %r9
    xor %r8d, %r8d
    test %rax, %rax
    jge 1f
    mov $1, %r8d
    neg %rax
1:
2:
    xor %rdx, %rdx
    div %r9
    add $'0', %dl
    dec %rsi
    mov %dl, (%rsi)
    inc %ecx
    test %rax, %rax
    jne 2b
    cmp $0, %r8d
    je 3f
    dec %rsi
    mov $'-', %al
    mov %al, (%rsi)
    inc %ecx
3:
    mov %ecx, %edx
    mov $1, %edi
    call ft_write
    add $40, %rsp
    ret
.size ft_putnbr, .-ft_putnbr
