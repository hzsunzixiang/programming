	.file	"switch_label.c"
	.text
	.globl	switch_eg_impl
	.type	switch_eg_impl, @function
switch_eg_impl:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	12(%ebp), %eax
	subl	$100, %eax
	movl	%eax, -8(%ebp)
	cmpl	$6, -8(%ebp)
	jbe	.L2
	jmp	.L3
.L2:
	movl	-8(%ebp), %eax
	movl	jt.1393(,%eax,4), %eax
	nop
	jmp	*%eax
.L3:
	movl	$0, -4(%ebp)
	jmp	.L5
.L6:
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L7
.L8:
	movl	8(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	jmp	.L5
.L9:
	movl	8(%ebp), %eax
	addl	$10, %eax
	movl	%eax, -4(%ebp)
.L7:
	addl	$11, -4(%ebp)
	jmp	.L5
.L10:
	movl	8(%ebp), %eax
	imull	8(%ebp), %eax
	movl	%eax, -4(%ebp)
.L5:
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	switch_eg_impl, .-switch_eg_impl
	.data
	.align 4
	.type	jt.1393, @object
	.size	jt.1393, 28
jt.1393:
	.long	.L8
	.long	.L3
	.long	.L9
	.long	.L6
	.long	.L10
	.long	.L3
	.long	.L10
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
