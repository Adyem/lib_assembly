.intel_syntax noprefix
.section .text
.globl ft_strcmp

ft_strcmp:
.Lloop:
        mov     al, byte ptr [rdi]
        mov     bl, byte ptr [rsi]
        cmp     al, bl
        jne     .Ldiff
        test    al, al
        je      .Lequal
        inc     rdi
        inc     rsi
        jmp     .Lloop

.Ldiff:
        movsx   eax, al
        movsx   ebx, bl
        sub     eax, ebx
        ret

.Lequal:
        xor     eax, eax
        ret
