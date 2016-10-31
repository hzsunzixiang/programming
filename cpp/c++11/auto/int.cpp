#include <typeinfo>
#include <iostream>

int main()
{
	int xxx = 11111111;
	long yyy = 11111111;
	long long zzz = 11111111;

//.LBB2:
//	.loc 1 6 0
//	movl	$11111111, -4(%rbp)
//	.loc 1 7 0
//	movq	$11111111, -16(%rbp)
//	.loc 1 8 0
//	movq	$11111111, -24(%rbp)
//	.loc 1 10 0
//	movl	$0, %eax
	return 0;
}
