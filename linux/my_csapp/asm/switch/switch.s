switch_eg:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	subl	$100, %eax
	cmpl	$6, %eax
	ja	.L2
	movl	.L4(,%eax,4), %eax
	jmp	*%eax
	.align 4
	.align 4
.L4:
	.long	.L3
	.long	.L2
	.long	.L5
	.long	.L6
	.long	.L7
	.long	.L2
	.long	.L7
	.text
.L3:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	jmp	.L8
.L5:
	addl	$10, -4(%ebp)
.L6:
	addl	$11, -4(%ebp)
	jmp	.L8
.L7:
	movl	-4(%ebp), %eax
	imull	-4(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L8
.L2:
	movl	$0, -4(%ebp)
.L8:
	movl	-4(%ebp), %eax
	leave
	ret
