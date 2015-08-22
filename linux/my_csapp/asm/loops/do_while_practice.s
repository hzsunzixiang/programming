dw_loop:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
.L3:
	movl	16(%ebp), %eax
	addl	%eax, 8(%ebp)
	movl	12(%ebp), %eax
	imull	16(%ebp), %eax
	movl	%eax, 12(%ebp)
	subl	$1, 16(%ebp)
	cmpl	$0, 16(%ebp)
	jle	.L2
	movl	12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L3
.L2:
	popl	%ebp
	ret
