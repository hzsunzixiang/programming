#include <typeinfo>
#include <iostream>

int main()
{
	int xxx = 11111111;
	long yyy = 11111111;
	long long zzz = 11111111;

	// movabsq	$1111111111111111, %rax
	long mmm = 1111111111111111;
	long nnn = 1111111111111111;

	printf(", xxx:%p\n, yyy:%p\n, zzz:%p\n, mmm:%p\n, nnn:%p\n", &xxx, &yyy, &zzz, &mmm, &nnn);
// , xxx:0x7ffe1788678c
// , yyy:0x7ffe17886780
// , zzz:0x7ffe17886778
// , mmm:0x7ffe17886770
// , nnn:0x7ffe17886768
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
