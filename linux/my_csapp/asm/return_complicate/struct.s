rotate_left:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	12(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -4(%ebp)
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-16(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-8(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-4(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	8(%ebp), %eax
	leave
	ret	$4
.LFE0:
	.size	rotate_left, .-rotate_left
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
