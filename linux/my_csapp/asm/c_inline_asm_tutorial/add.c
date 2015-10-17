
#include <stdio.h>
// https://github.com/1184893257/simplelinux/blob/master/inlineasm.md
int main()
{
	//int a=100, b=500, c=300;
	int a=100, b=800, sum=10000;


	// 下面用b初始化sum中的值  相当于*2
//    __asm__ __volatile__(
//        "addl %1, %0"       // 1
//        : "=g"(sum)           // 2  sum(0)  b(1) 
//        : "0"(b), "g"(b)    // 3  "0" here specifies the same constraint as the 0th output variable.
//        : "memory");        // 4
//
//	printf("现在sum是:%d, a: %d, b:%d\n", sum, a, b);
//
	// a初始化sum，然后和b相加 可以查看其汇编输出来理解
    __asm__ (
        "addl %2, %0"       // 1
        : "=g"(sum)           // 2  sum(0)  a(1) b(2)
        : "0"(a), "g"(b)    // 3  "0" here specifies the same constraint as the 0th output variable.
        : "memory");        // 4
	printf("现在sum是:%d, a: %d, b:%d\n", sum, a, b);

// 第3行是输入操作数，都是 "?"(var) 的形式， ? 除了可以是上面的那些标识符，还可以是输出操作数的序号， 表示用 var 来初始化该输出操作数， 上面的程序中 %0 和 %1 就是一个东西，初始化为 1（a的值）。
// 如果	 Matching(Digit) constraints 不对，比如上面0 写成了1 
// 报错  error: matching constraint references invalid operand number

//	__asm__ ( 
//
//			"addl %2,%2\n\tmovl %1,%0\n" 
//
//			:"=m"(sum) 
//
//			:"r"(a),"r"(b) 
//
//			); 

	return 0;
}
