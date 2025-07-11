.intel_syntax noprefix

.section .text
.globl  ft_strcpy
ft_strcpy:
        mov     rax, rdi
        test    rdi, rdi
        je      ft_strcpy_null
        test    rsi, rsi
        je      ft_strcpy_null
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
.ft_strcpy_null:
        xor     eax, eax            # rax = 0
        ret

.section .data
orig1:  .asciz "Hello, Assembly!"   # zero-terminated string

buf1:   .space 50, 0                # 50 zero bytes
orig2:  .byte 0                     # a single NUL
buf2:   .space 10, 0                # 10 zero bytes
