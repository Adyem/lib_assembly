        .section .data
msg:    .asciz  "Hello, world!\n"

orig1:  .asciz  "first string\0"
orig2:  .asciz  "second string\0"

cmp_res1:       .long 0
cmp_res2:       .long 0

write_ret:      .quad 0
write_errno:    .long 0
msg_len:        .long 0

        .lcomm  buf1, 32
        .lcomm  buf2, 32

        .section .text
        .globl  main
        .type   main, @function

        .extern ft_strlen
        .extern ft_strcpy
        .extern ft_strcmp
        .extern ft_write

strlen_test:
        lea     msg(%rip), %rdi
        call    ft_strlen

        ret
        .size   strlen_test, .-strlen_test

strcpy_test:
        lea     buf1(%rip), %rdi
        lea     orig1(%rip), %rsi
        call    ft_strcpy

        lea     buf2(%rip), %rdi
        lea     orig2(%rip), %rsi
        call    ft_strcpy

        ret
        .size   strcpy_test, .-strcpy_test

strcmp_test:
        lea     orig1(%rip), %rdi
        lea     orig2(%rip), %rsi
        call    ft_strcmp
        mov     %eax, cmp_res1(%rip)

        lea     orig1(%rip), %rdi
        lea     orig1(%rip), %rsi
        call    ft_strcmp
        mov     %eax, cmp_res2(%rip)

        ret
        .size   strcmp_test, .-strcmp_test

write_test:
        lea     msg(%rip), %rdi
        call    ft_strlen
        mov     %eax, msg_len(%rip)

        mov     %eax, %edx              # count
        lea     msg(%rip), %rsi         # buf
        mov     $1, %edi                # fd
        call    ft_write

        mov     msg_len(%rip), %edx
        lea     msg(%rip), %rsi
        mov     $-1, %edi
        call    ft_write
        mov     %eax, write_ret(%rip)
        call    __errno_location
        mov     (%rax), %eax
        mov     %eax, write_errno(%rip)

        ret
        .size   write_test, .-write_test

main:
        call    strlen_test
        call    strcpy_test
        call    strcmp_test
        call    write_test
        xor     %eax, %eax
        ret
        .size   main, .-main
