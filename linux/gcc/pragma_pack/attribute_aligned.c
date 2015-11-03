#include <stdio.h>
#include <stddef.h>

int main(void)
{


	// 基本演示
	//int x1 __attribute__ ((aligned (16))) = 0;
	//int x2 __attribute__ ((aligned (16))) = 0;
	//int x3 __attribute__ ((aligned (16))) = 0;
	//int x4 = 0;
	//int x5 = 0;
	//int x6 = 0;

	//printf("sizeof(x1):%lu\n", sizeof(x1));

	// 数组

	////short array[3] __attribute__ ((aligned));
	//short array[3]; 
	//array[0] = 100;
	//array[1] = 200;
	//array[2] = 300;
	// sizeof(x1):4 其大小不会发生变化
	//
	//
	struct S
	{
		short f[3];
	} __attribute__ ((aligned (8)));  // 结构体大小为8
	//} ; // 结构体大小为6
	//
	//
	struct S s;
	s.f[0] = 100;
	s.f[1] = 200;
	s.f[2] = 300;
	//typedef int more_aligned_int __attribute__ ((aligned (8)));
	printf("sizeof(struct S):%lu\n", sizeof(struct S));



	//struct foo 
	//{
	//	int x[2] __attribute__ ((aligned (8))); 
	//	int x1 __attribute__ ((aligned (16))) ;
	//	int x2 __attribute__ ((aligned (16))) ;
	//};


	//struct foo test;
	//test.x[0] = 555555;
	//test.x[1] = 666666;
	//test.x1 = 777777;
	//test.x2 = 888888;

	// movl	$0, -16(%rbp)
	// movl	$0, -32(%rbp)
	// movl	$0, -48(%rbp)
	// movl	$0, -52(%rbp)
	// movl	$0, -56(%rbp)
	// movl	$0, -60(%rbp)


	return 0;
}


