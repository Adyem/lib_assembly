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

main:
        call    strlen_test
        call    strcpy_test
        xor     %eax, %eax
        ret
        .size   main, .-main
