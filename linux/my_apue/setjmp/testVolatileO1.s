	.file	"testVolatile.c"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB1:
	.cfi_startproc
	movl	$4, -4(%rsp)
	movl	$5, statval.1733(%rip)
	movl	-4(%rsp), %eax
	movl	$95, globval(%rip)
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	foo, .-foo
	.local	statval.1733
	.comm	statval.1733,4,4
	.local	globval
	.comm	globval,4,4
	.ident	"GCC: (GNU) 4.8.3 20140911 (Red Hat 4.8.3-9)"
	.section	.note.GNU-stack,"",@progbits
