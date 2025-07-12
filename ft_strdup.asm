.text
.globl ft_strdup
.type  ft_strdup, @function
.extern ft_strlen
.extern ft_strcpy
.extern malloc
.extern __errno_location

ft_strdup:
    push %rdi              # save source pointer
    call ft_strlen         # rax = length of string
    mov %rax, %rdx         # rdx = length
    add $1, %rdx           # rdx = length + 1 (size to allocate)
    mov %rdx, %rdi         # argument for malloc
    call malloc
    test %rax, %rax
    je .Lmalloc_fail
    mov %rax, %rdi         # dest pointer
    pop %rsi               # restore source pointer into rsi
    call ft_strcpy         # copy string
    ret

.Lmalloc_fail:
    pop %rdi               # clean stack
    mov $12, %edi          # ENOMEM
    call __errno_location
    mov %edi, (%rax)
    xor %rax, %rax         # return NULL
    ret
.size ft_strdup, .-ft_strdup
