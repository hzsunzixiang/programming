gotodiff:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L2
	nop
.L3:
	movl	8(%ebp), %eax
	subl	12(%ebp), %eax
	jmp	.L4
.L2:
	movl	12(%ebp), %eax
	subl	8(%ebp), %eax
.L4:
	popl	%ebp
	ret
