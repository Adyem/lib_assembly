.text
.globl ft_strdup
.type  ft_strdup, @function
.extern ft_strlen
.extern ft_strcpy
.extern malloc
.extern __errno_location

ft_strdup:
    push %rdi
    call ft_strlen
    mov %rax, %rdx
    add $1, %rdx
    mov %rdx, %rdi
    call malloc
    test %rax, %rax
    je .Lmalloc_fail
    mov %rax, %rdi
    pop %rsi
    call ft_strcpy
    ret

.Lmalloc_fail:
    pop %rdi
    mov $12, %edi
    call __errno_location
    mov %edi, (%rax)
    xor %rax, %rax
    ret
.size ft_strdup, .-ft_strdup
