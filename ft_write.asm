.text
.globl ft_write
.type  ft_write, @function
.extern __errno_location
ft_write:
    mov $1, %rax
    syscall
    cmp $0, %rax
    jge .Ldone
    neg %rax
    mov %eax, %edi
    call __errno_location
    mov %edi, (%rax)
    mov $-1, %rax
.Ldone:
    ret
.size ft_write, .-ft_write
