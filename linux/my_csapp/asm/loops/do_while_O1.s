fact_do:
.LFB0:
	movl	4(%esp), %edx
	movl	$1, %eax
.L2:
	imull	%edx, %eax
	subl	$1, %edx
	cmpl	$1, %edx
	jg	.L2
	rep ret
