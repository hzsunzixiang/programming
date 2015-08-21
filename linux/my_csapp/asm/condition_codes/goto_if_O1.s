	.file	"goto_if.c"
	.text
	.globl	gotodiff
	.type	gotodiff, @function
gotodiff:
.LFB0:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cmpl	%ecx, %edx
	jge	.L3
	movl	%ecx, %eax
	subl	%edx, %eax
.L2:
.L3:
	rep ret
	.cfi_endproc
.LFE0:
	.size	gotodiff, .-gotodiff
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
