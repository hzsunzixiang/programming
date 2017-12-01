
#include <stdio.h>


int main()
{
	volatile int some_int = 100;

	// 加 volatile
	// movl	-4(%rbp), %eax
	// cmpl	$100, %eax

	// 无 volatile
	// cmpl	$100, -4(%rbp)
	// je	.L2

	while(some_int == 100)
	{
		   //your code
	}
	return 0;
}
