    .text
    .globl ft_strlen
    .type  ft_strlen, @function
ft_strlen:
    xor     %rcx, %rcx
.Lloop:
    movzb   (%rdi,%rcx,1), %eax
    test    %al, %al
    je      .Ldone
    inc     %rcx
    jmp     .Lloop

.Ldone:
    mov     %ecx, %eax
    ret

.Lzero:
    xor     %eax, %eax
    ret
    .size   ft_strlen, .-ft_strlen
