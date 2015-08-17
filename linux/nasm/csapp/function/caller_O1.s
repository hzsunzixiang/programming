
优化代码 跟书上描述类似，但是还是不一样
swap_add:
.LFB0:
	pushl	%ebx
	movl	8(%esp), %ebx
	movl	12(%esp), %ecx
	movl	(%ebx), %edx
	movl	(%ecx), %eax
	movl	%eax, (%ebx)
	movl	%edx, (%ecx)
	addl	%edx, %eax
	popl	%ebx
	ret
caller:
.LFB1:
	.cfi_startproc
	movl	$832093, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	caller, .-caller
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
