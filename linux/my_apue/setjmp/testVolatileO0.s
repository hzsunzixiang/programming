	.file	"testVolatile.c"
	.local	globval
	.comm	globval,4,4
	.text
	.type	f1, @function
f1:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	$95, globval(%rip)
	movl	$96, -4(%rbp)
	movl	$97, -8(%rbp)
	movl	$98, -12(%rbp)
	movl	$99, -16(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	f1, .-f1
	.globl	foo
	.type	foo, @function
foo:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 3, -24
	movl	$1, globval(%rip)
	movl	$2, -12(%rbp)
	movl	$3, %ebx
	movl	$4, -16(%rbp)
	movl	$5, statval.1733(%rip)
	movl	statval.1733(%rip), %ecx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%ebx, %esi
	movl	%eax, %edi
	call	f1
	movl	$0, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	foo, .-foo
	.local	statval.1733
	.comm	statval.1733,4,4
	.ident	"GCC: (GNU) 4.8.3 20140911 (Red Hat 4.8.3-9)"
	.section	.note.GNU-stack,"",@progbits
