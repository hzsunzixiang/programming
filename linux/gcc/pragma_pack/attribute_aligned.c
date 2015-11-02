#include <stdio.h>
#include <stddef.h>

int main(void)
{
	int x1 __attribute__ ((aligned (16))) = 0;
	int x2 __attribute__ ((aligned (16))) = 0;
	int x3 __attribute__ ((aligned (16))) = 0;
	int x4 = 0;
	int x5 = 0;
	int x6 = 0;


	// movl	$0, -16(%rbp)
	// movl	$0, -32(%rbp)
	// movl	$0, -48(%rbp)
	// movl	$0, -52(%rbp)
	// movl	$0, -56(%rbp)
	// movl	$0, -60(%rbp)


	return 0;
}


