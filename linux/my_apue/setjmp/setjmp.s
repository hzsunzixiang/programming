	.file	"setjmp.c"
	.local	jmpbuffer
	.comm	jmpbuffer,200,32
	.local	globval
	.comm	globval,4,4
	.section	.rodata
.LC0:
	.string	"after longjmp: ret:%d\n"
	.align 8
.LC1:
	.string	"globval = %d; autoval = %d; regival = %d; volaval = %d; statval = %d;\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$1, globval(%rip)
	movl	$2, -4(%rbp)
	movl	$3, -20(%rbp)
	movl	$4, -12(%rbp)
	movl	$5, statval.4172(%rip)
	movl	$0, -8(%rbp)
	movl	$jmpbuffer, %edi
	call	_setjmp
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L2
	movq	stderr(%rip), %rax
	movl	-8(%rbp), %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	statval.4172(%rip), %esi
	movl	-12(%rbp), %edi
	movl	globval(%rip), %edx
	movq	stderr(%rip), %rax
	movl	-4(%rbp), %ecx
	movl	%esi, (%rsp)
	movl	%edi, %r9d
	movl	-20(%rbp), %r8d
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %edi
	call	exit
.L2:
	movl	$95, globval(%rip)
	movl	$96, -4(%rbp)
	movl	$97, -20(%rbp)
	movl	$98, -12(%rbp)
	movl	$99, statval.4172(%rip)
	movl	statval.4172(%rip), %ecx
	movl	-12(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	-20(%rbp), %esi
	movl	%eax, %edi
	call	f1
	movl	$0, %edi
	call	exit
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
.LC2:
	.string	"int f1():\n"
	.text
	.type	f1, @function
f1:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movl	globval(%rip), %edx
	movq	stderr(%rip), %rax
	movl	-12(%rbp), %r8d
	movl	-8(%rbp), %edi
	movl	-4(%rbp), %ecx
	movl	-16(%rbp), %esi
	movl	%esi, (%rsp)
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	f2
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	f1, .-f1
	.type	f2, @function
f2:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %esi
	movl	$jmpbuffer, %edi
	call	longjmp
	.cfi_endproc
.LFE4:
	.size	f2, .-f2
	.local	statval.4172
	.comm	statval.4172,4,4
	.ident	"GCC: (GNU) 4.8.3 20140911 (Red Hat 4.8.3-9)"
	.section	.note.GNU-stack,"",@progbits
