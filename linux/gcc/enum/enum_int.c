#include <stdio.h>




// 一个整形能容纳得了的话，
//.L3:
//	movl	$11111, %eax
//	jmp	.L5
//.L4:
//	movl	$22222, %eax
//	jmp	.L5

enum result_t {
	RESULT_INT    = 11111,
	RESULT_DOUBLE = 22222,
	RESULT_SHORT  = 33333,
};

// result_t returnRes(int flag)  // c++ 中的声明方式
//enum result_t returnRes(int flag)  // c语言中必须加enum
enum result_t returnRes(int flag)  // c语言中必须加enum
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

	enum result_t  en = RESULT_INT; // 直接用常量替换了  movl	$11111, 24(%esp)
	enum result_t  *ep = &en;
    // void *p =  &RESULT_INT;  // main.c:30: error: lvalue required as unary ‘&’ operand
	printf("en == returnRes(1):%d\n", en == returnRes(1));
	return 0;
}

// http://stackoverflow.com/questions/1206579/memory-location-of-enum-value-in-c

// 对比define
// enum result_t returnRes(int flag)
// {
// 	switch (flag) {
// 		case 1:
// 			return RESULT_INT;
// 		case 2:
// 			return RESULT_DOUBLE;
// 		case 3:
// 			return RESULT_SHORT;
// 		default:
// 			return RESULT_INT;
// 	}
// 	return RESULT_DOUBLE;
// }

