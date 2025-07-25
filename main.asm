        .section .data
msg:    	   	.asciz  "Hello, world!\n"
strlen_hdr:    	.asciz  "== ft_strlen tests ==\n"
strcmp_hdr:    	.asciz  "== ft_strcmp tests ==\n"
strcpy_head:   	.asciz  "== ft_strcpy tests ==\n"
write_hdr:     	.asciz  "== ft_write tests ==\n"
read_hdr:      	.asciz  "== ft_read tests ==\n"
strdup_hdr:    	.asciz  "== ft_strdup tests ==\n"

strlen_msg1:   	.asciz  "ft_strlen(\"Hello, world!\\n\") = "
strlen_msg2:   	.asciz  "ft_strlen(\"\") = "
strlen_msg3:   	.asciz  "hello world: "
strcpy_hdr:    	.asciz  "ft_strcpy results:\n"
dest1_lbl:     	.asciz  "buf1: "
dest2_lbl:     	.asciz  "buf2: "
strcmp_msg1:   	.asciz  "ft_strcmp(orig1, orig2) = "
strcmp_msg2:   	.asciz  "ft_strcmp(orig1, orig1) = "
write_msg1:    	.asciz  "ft_write valid return = "
write_msg2:    	.asciz  "ft_write invalid return = "
read_msg:      	.asciz  "ft_read invalid return = "
errno_lbl:     	.asciz  " errno: "
dup_msg:       	.asciz  "ft_strdup result: "
dup_fail:      	.asciz  "ft_strdup failed"
nl_str:        	.asciz  "\n"
empty_str:     	.byte 0

orig1:  	   	.asciz  "first string\0"
orig2:  	   	.asciz  "second string\0"

newline:        .byte 10

cmp_res1:       .long 0
cmp_res2:       .long 0

write_ret:      .quad 0
write_errno:    .long 0
msg_len:        .long 0

read_ret:       .quad 0
read_errno:     .long 0
dup_ptr:        .quad 0

        .lcomm  buf1, 32
        .lcomm  buf2, 32
        .lcomm  read_buf, 32

        .section .text
        .globl  main
        .type   main, @function

        .extern ft_strlen
        .extern ft_strcpy
        .extern ft_strcmp
        .extern ft_write
        .extern ft_read
        .extern ft_strdup
        .extern free
        .extern ft_putnbr

print_str:
        push    %rdi
        call    ft_strlen
        mov     %eax, %edx
        pop     %rsi
        mov     $1, %edi
        call    ft_write
        ret
        .size   print_str, .-print_str

strlen_test:
        lea     strlen_hdr(%rip), %rdi
        call    print_str
        lea     strlen_msg1(%rip), %rdi
        call    print_str
        lea     msg(%rip), %rdi
        call    ft_strlen
        mov     %rax, %rdi
        call    ft_putnbr
        lea     nl_str(%rip), %rdi
        call    print_str

        lea     strlen_msg2(%rip), %rdi
        call    print_str
        lea     empty_str(%rip), %rdi
        call    ft_strlen
        mov     %rax, %rdi
        call    ft_putnbr
        lea     nl_str(%rip), %rdi
        call    print_str

		lea		strlen_msg3(%rip), %rdi
		call	print_str
		lea		strlen_msg3(%rip), %rdi
		call	ft_strlen
		mov		%rax, %rdi
		call	ft_putnbr
		lea		nl_str(%rip), %rdi
		call	print_str

        ret
        .size   strlen_test, .-strlen_test

strcpy_test:
        lea     strcpy_head(%rip), %rdi
        call    print_str

        lea     buf1(%rip), %rdi
        lea     orig1(%rip), %rsi
        call    ft_strcpy
        lea     dest1_lbl(%rip), %rdi
        call    print_str
        lea     buf1(%rip), %rdi
        call    print_str
        lea     nl_str(%rip), %rdi
        call    print_str

        lea     buf2(%rip), %rdi
        lea     orig2(%rip), %rsi
        call    ft_strcpy
        lea     dest2_lbl(%rip), %rdi
        call    print_str
        lea     buf2(%rip), %rdi
        call    print_str
        lea     nl_str(%rip), %rdi
        call    print_str

        ret
        .size   strcpy_test, .-strcpy_test

strcmp_test:
        lea     strcmp_hdr(%rip), %rdi
        call    print_str
        lea     strcmp_msg1(%rip), %rdi
        call    print_str
        lea     orig1(%rip), %rdi
        lea     orig2(%rip), %rsi
        call    ft_strcmp
        movsxd  %eax, %rdi
        call    ft_putnbr
        lea     nl_str(%rip), %rdi
        call    print_str

        lea     strcmp_msg2(%rip), %rdi
        call    print_str
        lea     orig1(%rip), %rdi
        lea     orig1(%rip), %rsi
        call    ft_strcmp
        movsxd  %eax, %rdi
        call    ft_putnbr
        lea     nl_str(%rip), %rdi
        call    print_str

        ret
        .size   strcmp_test, .-strcmp_test

write_test:
        lea     write_hdr(%rip), %rdi
        call    print_str
        lea     msg(%rip), %rdi
        call    ft_strlen
        mov     %eax, msg_len(%rip)

        lea     write_msg1(%rip), %rdi
        call    print_str
        mov     msg_len(%rip), %edx
        lea     msg(%rip), %rsi
        mov     $1, %edi
        call    ft_write
        mov     %eax, %edi
        call    ft_putnbr
        lea     nl_str(%rip), %rdi
        call    print_str

        lea     write_msg2(%rip), %rdi
        call    print_str
        mov     msg_len(%rip), %edx
        lea     msg(%rip), %rsi
        mov     $-1, %edi
        call    ft_write
        mov     %eax, %edi
        call    ft_putnbr
        lea     errno_lbl(%rip), %rdi
        call    print_str
        call    __errno_location
        mov     (%rax), %eax
        mov     %eax, %edi
        call    ft_putnbr
        lea     nl_str(%rip), %rdi
        call    print_str

        ret
        .size   write_test, .-write_test

read_test:
        lea     read_hdr(%rip), %rdi
        call    print_str
        lea     read_msg(%rip), %rdi
        call    print_str
        mov     $16, %edx
        lea     read_buf(%rip), %rsi
        mov     $-1, %edi
        call    ft_read
        mov     %eax, %edi
        call    ft_putnbr
        lea     errno_lbl(%rip), %rdi
        call    print_str
        call    __errno_location
        mov     (%rax), %eax
        mov     %eax, %edi
        call    ft_putnbr
        lea     nl_str(%rip), %rdi
        call    print_str

        ret
        .size   read_test, .-read_test

strdup_test:
        lea     strdup_hdr(%rip), %rdi
        call    print_str
        lea     dup_msg(%rip), %rdi
        call    print_str
        lea     orig1(%rip), %rdi
        call    ft_strdup
        test    %rax, %rax
        je      .Ldup_fail_print
        mov     %rax, dup_ptr(%rip)
        mov     %rax, %rdi
        call    print_str
        lea     nl_str(%rip), %rdi
        call    print_str
        mov     dup_ptr(%rip), %rdi
        call    free
        ret

.Ldup_fail_print:
        lea     dup_fail(%rip), %rdi
        call    print_str
        lea     nl_str(%rip), %rdi
        call    print_str
        ret
        .size   strdup_test, .-strdup_test

main:
        call    strlen_test
        call    strcpy_test
        call    strcmp_test
        call    write_test
        call    read_test
        call    strdup_test
        xor     %eax, %eax
        ret
        .size   main, .-main
