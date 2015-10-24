#include <stdio.h>




// 一个整形能容纳得了的话，
//
// 效果跟用enum 和 define 不一样 ， enum 和 define没有地址


// .L3:
// 	movl	RESULT_INT1, %eax
// 	jmp	.L6
// .L4:
// 	movl	RESULT_INT2, %eax
// 	jmp	.L6
// .L5:
// 	movl	RESULT_INT3, %eax
// 	jmp	.L6
// .L8:
// 	movl	RESULT_INT1, %eax
//
// RESULT_INT1:
// 	.long	11111
// 	.align 4
// 	.type	RESULT_INT2, @object
// 	.size	RESULT_INT2, 4
//
//
//这是有地址的
static int const RESULT_INT1 = 11111;
static int const RESULT_INT2 = 22222;
static int const RESULT_INT3 = 33333;

int returnRes(int flag)  // c语言中必须加enum
{
	switch (flag) {
	case 1:
		 return RESULT_INT1;
	case 2:
		return RESULT_INT2;
	case 3:
		return RESULT_INT3; 
	default:
		return RESULT_INT1;
	}
	return RESULT_INT3;
}

int main()
{

	int const * x = &RESULT_INT1;
	// *x = 999; //error

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
