	.file	"do_while_practice.c"
	.text
	.globl	dw_loop
	.type	dw_loop, @function
dw_loop:   没有发现 x+=n 的影子，难道优化掉了?
.LFB0:
	movl	8(%esp), %edx
	movl	12(%esp), %eax
.L2:
	imull	%eax, %edx
	subl	$1, %eax
	cmpl	%eax, %edx
	jge	.L4
	testl	%eax, %eax
	jg	.L2
.L4:
	rep ret
	.cfi_endproc
.LFE0:
	.size	dw_loop, .-dw_loop
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
