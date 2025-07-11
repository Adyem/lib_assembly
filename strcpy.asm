.intel_syntax noprefix

.section .text
.globl  ft_strcpy

ft_strcpy:
        mov     rax, rdi
.ft_strcpy_loop:
        mov     bl, byte ptr [rsi]
        mov     byte ptr [rdi], bl
        test    bl, bl
        je      .ft_strcpy_end
        inc     rsi
        inc     rdi
        jmp     .ft_strcpy_loop
.ft_strcpy_end:
        ret

.section .data
orig1:  .asciz "Hello, Assembly!"

buf1:   .space 50, 0
orig2:  .byte 0
buf2:   .space 10, 0
