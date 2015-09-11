	.file	"setjmp.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"after longjmp: ret:%d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"globval = %d; autoval = %d; regival = %d; volaval = %d; statval = %d;\n"
	.section	.rodata.str1.1
.LC2:
	.string	"int f1():\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB36:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movl	$1, globval(%rip)
	movl	$4, 28(%rsp)
	movl	$5, statval.4420(%rip)
	movl	$jmpbuffer, %edi
	call	_setjmp
	testl	%eax, %eax
	je	.L2
	movl	%eax, %edx
	movl	$.LC0, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	fprintf
	movl	28(%rsp), %r9d
	movl	statval.4420(%rip), %eax
	movl	%eax, (%rsp)
	movl	$3, %r8d
	movl	$2, %ecx
	movl	globval(%rip), %edx
	movl	$.LC1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %edi
	call	exit
.L2:
	movl	$95, globval(%rip)
	movl	$98, 28(%rsp)
	movl	$99, statval.4420(%rip)
	movl	28(%rsp), %ebx
	movq	stderr(%rip), %rcx
	movl	$10, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movl	$99, (%rsp)
	movl	%ebx, %r9d
	movl	$97, %r8d
	movl	$96, %ecx
	movl	globval(%rip), %edx
	movl	$.LC1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %esi
	movl	$jmpbuffer, %edi
	call	longjmp
	.cfi_endproc
.LFE36:
	.size	main, .-main
	.local	statval.4420
	.comm	statval.4420,4,4
	.local	globval
	.comm	globval,4,4
	.local	jmpbuffer
	.comm	jmpbuffer,200,32
	.ident	"GCC: (GNU) 4.8.3 20140911 (Red Hat 4.8.3-9)"
	.section	.note.GNU-stack,"",@progbits
