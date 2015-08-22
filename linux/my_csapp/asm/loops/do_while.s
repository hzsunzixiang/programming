fact_do:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	imull	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	subl	$1, 8(%ebp)
	cmpl	$1, 8(%ebp)
	jg	.L2
	movl	-4(%ebp), %eax
	leave
	ret
