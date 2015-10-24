#include <stdio.h>


// 可见其长度时自行调整的

// 在32位系统下，超过32位的数据时， 放在两个寄存器中
// TODO 64位
// .L3:
// 	movl	$0, %eax
// 	movl	$1, %edx
// 	jmp	.L5
// .L4:
// 	movl	$100, %eax
// 	movl	$1, %edx
// 	jmp	.L5
// .L7:
// 	movl	$200, %eax
// 	movl	$1, %edx

enum result_l {
	RESULT_LONG1 = 1,
	RESULT_LONG2 = 4294967296 + 100,
	RESULT_LONG3 = 4294967296 + 200,
};

enum result_l returnRes(int flag)  // c语言中必须加enum
{
	switch (flag) {
	case 1:
		 return RESULT_LONG1;
	case 2:
		return RESULT_LONG2;
	default:
		return RESULT_LONG3;
	}
	return RESULT_LONG3;
}

int main()
{

	enum result_l  en = RESULT_LONG1; // 直接用常量替换了  movl	$11111, 24(%esp)
	enum result_l  *ep = &en;
    // void *p =  &RESULT_INT;  // main.c:30: error: lvalue required as unary ‘&’ operand
	printf("returnRes(1):%lld\n", returnRes(1));
	printf("returnRes(2):%lld\n", returnRes(2));
	printf("en == returnRes(1):%d\n", en == returnRes(1));
	printf("sizeof(enum result_t):%d\n", sizeof(en));
	return 0;
}

// http://stackoverflow.com/questions/1206579/memory-location-of-enum-value-in-c
