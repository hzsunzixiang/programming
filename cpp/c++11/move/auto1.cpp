#include <typeinfo>
#include <iostream>

int main()
{
	// movabsq	$1111111111111111, %rax
	auto mmm = 1111111111111111;
	auto nnn = 1111111111111111;
	auto xxx = 11111111;
	auto yyy = 11111111L;
	auto zzz = 11111111LL;


	printf(", xxx:%p\n, yyy:%p\n, zzz:%p\n, mmm:%p\n, nnn:%p\n", &xxx, &yyy, &zzz, &mmm, &nnn);
// , xxx:0x7ffd0c86120c
// , yyy:0x7ffd0c861200
// , zzz:0x7ffd0c8611f8
// , mmm:0x7ffd0c8611f0
// , nnn:0x7ffd0c8611e8
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
