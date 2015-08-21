gotodiff:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L2
	nop
.L3:
	movl	8(%ebp), %eax
	subl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L4
.L2:
	movl	12(%ebp), %eax
	subl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	nop
.L4:
	movl	-4(%ebp), %eax
	leave
	ret
.LFE0:
	.size	gotodiff, .-gotodiff
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
