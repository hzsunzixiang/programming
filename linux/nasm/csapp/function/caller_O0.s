swap_add:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax    get xp
	movl	(%eax), %eax     get x
	movl	%eax, -4(%ebp)   push x to stack 
	movl	12(%ebp), %eax   get yp
	movl	(%eax), %eax     get y
	movl	%eax, -8(%ebp)   push y to stack
	movl	8(%ebp), %eax    get xp
	movl	-8(%ebp), %edx   get y
	movl	%edx, (%eax)     store y at xp
	movl	12(%ebp), %eax   get yp
	movl	-4(%ebp), %edx   get x
	movl	%edx, (%eax)     store x at yp
	movl	-4(%ebp), %edx   get x 
	movl	-8(%ebp), %eax   get y
	addl	%edx, %eax        return x + y  at eax
	leave
	ret



int swap_add(int *xp, int *yp)
{
	int x = *xp;
	int y = *yp;

	*xp = y;
	*yp = x;
	return x + y;
}

int caller()
{
	int arg1 = 534;
	int arg2 = 1057;
	int sum = swap_add(&arg1, &arg2);
	int diff = arg1 - arg2;
	
	return sum * diff;
}

caller:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$534, -12(%ebp)
	movl	$1057, -16(%ebp)
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-12(%ebp), %eax
	pushl	%eax
	call	swap_add
	addl	$8, %esp
	movl	%eax, -4(%ebp)
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	imull	-8(%ebp), %eax
	leave
	ret
