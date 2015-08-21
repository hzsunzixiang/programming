test:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	addl	$1, %eax
	cltd
	movl	%eax, -8(%ebp)
	movl	%edx, -4(%ebp)
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	leave
	ret
.LFE0:
	.size	test, .-test
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
