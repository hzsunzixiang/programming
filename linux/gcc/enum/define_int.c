#include <stdio.h>




// 一个整形能容纳得了的话，
//
// 效果跟用enum一样，只是 enum在编译期间  define在预编译期间
// .L3:
// 	movl	$11111, %eax
// 	jmp	.L6
// .L4:
// 	movl	$22222, %eax
// 	jmp	.L6
// .L5:
// 	movl	$33333, %eax

#define	RESULT_INT     11111
#define	RESULT_DOUBLE  22222
#define	RESULT_SHORT   33333

int returnRes(int flag)  // c语言中必须加enum
{
	switch (flag) {
	case 1:
		 return RESULT_INT;
	case 2:
		return RESULT_DOUBLE;
	case 3:
		return RESULT_SHORT;   // 如果不用这个枚举，汇编中根本就不会出现，只有出现时才做替换
	default:
		return RESULT_INT;
	}
	return RESULT_DOUBLE;
}

int main()
{

	printf("returnRes(1):%d\n", returnRes(1));
	return 0;
}

// 预编译之后 对比enum
// int returnRes(int flag)
// {
// 	switch (flag) {
// 		case 1:
// 			return 11111;
// 		case 2:
// 			return 22222;
// 		case 3:
// 			return 33333;
// 		default:
// 			return 11111;
// 	}
// 	return 22222;
// }
// 
