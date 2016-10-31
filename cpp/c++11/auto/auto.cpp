#include <typeinfo>
#include <iostream>

int main()
{
	auto xxx = 11111111;
	auto yyy = 11111111L;
	auto zzz = 11111111LL;

//.LBB2:
//	.loc 1 6 0
//	movl	$11111111, -4(%rbp)
//	.loc 1 7 0
//	movq	$11111111, -16(%rbp)
//	.loc 1 8 0
//	movq	$11111111, -24(%rbp)
//	.loc 1 19 0
//	movl	$0, %eax

	return 0;

}
