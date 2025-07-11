        .section .data
msg:    .asciz  "Hello, world!\0"

orig1:  .asciz  "first string\0"
orig2:  .asciz  "second string\0"

        .lcomm  buf1, 32
        .lcomm  buf2, 32

        .section .text
        .globl  main
        .type   main, @function

        .extern ft_strlen
        .extern ft_strcpy

strlen_test:
        lea     msg(%rip), %rdi    # &msg
        call    ft_strlen

        xor     %rdi, %rdi         # NULL
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

        mov     $0, %rdi           # NULL dst
        lea     orig1(%rip), %rsi
        call    ft_strcpy

        lea     buf1(%rip), %rdi
        mov     $0, %rsi           # NULL src
        call    ft_strcpy
        ret
        .size   strcpy_test, .-strcpy_test

main:
        call    strlen_test
        call    strcpy_test
        xor     %eax, %eax         # return 0
        ret
        .size   main, .-main
