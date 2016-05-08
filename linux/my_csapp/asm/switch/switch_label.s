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
	ja	.L11
.L2:
	movl	-8(%ebp), %eax
	movl	jt.1816(,%eax,4), %eax
	nop
	jmp	*%eax
.L11:
	nop
.L3:
	movl	$0, -4(%ebp)
	jmp	.L4
.L5:
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L6
.L7:
	movl	8(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	jmp	.L4
.L8:
	movl	8(%ebp), %eax
	addl	$10, %eax
	movl	%eax, -4(%ebp)
.L6:
	addl	$11, -4(%ebp)
	jmp	.L4
.L9:
	movl	8(%ebp), %eax
	imull	8(%ebp), %eax
	movl	%eax, -4(%ebp)
.L4:
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	switch_eg_impl, .-switch_eg_impl
	.section	.rodata
.LC0:
	.string	"x=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	$100, 4(%esp)
	movl	$10, (%esp)
	call	switch_eg_impl
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.data
	.align 4
	.type	jt.1816, @object
	.size	jt.1816, 28
jt.1816:
	.long	.L7
	.long	.L3
	.long	.L8
	.long	.L5
	.long	.L9
	.long	.L3
	.long	.L9
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
