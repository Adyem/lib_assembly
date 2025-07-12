.text
.globl ft_read
.type  ft_read, @function
.extern __errno_location
ft_read:
    mov $0, %rax
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
.size ft_read, .-ft_read
