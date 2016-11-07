#include <typeinfo>
#include <iostream>


//int foo( int nDataSize, int iterations ) 
//{
//	for ( int i = 0; i < iterations ; ++i )
//	{
//		char *bytes = alloca( nDataSize );
//		// the memory above IS NOT FREED when we pass the brace below!
//	} 
//	return 0;
//}  // alloca() memory only gets freed here


int main()
{
	int xxx = 111;
	int yyy = 111;
	char *bytes = (char*)alloca( 1024000);
	int zzz = 222;
	char *bytes1 = (char*)malloc( 1024);
	char *bytes2 = (char*)alloca( 1024);
	char *bytes3 = (char*)malloc( 1024);
	printf(", xxx:%p\n, yyy:%p\n, bytes:%p\n, zzz:%p\n, bytes1:%p\n", &xxx, &yyy, bytes, &zzz, bytes1);

	return 0;
}
/// 明显看出 栈上 和 堆上内存
//root@debian:~/programming/cpp/c++11/alloca# ./main 
//, xxx:0x7ffef705730c
//, yyy:0x7ffef7057308
//, bytes:0x7ffef7056ef0
//, zzz:0x7ffef7057304
//, bytes1:0x7ab010


// 注意看malloc中间的 这个就是alloca的作用//	movl	$1024, %edi
//	call	malloc
//	movq	%rax, -16(%rbp)
//	.loc 1 23 0
//	movl	$16, %eax
//	subq	$1, %rax
//	addq	$1039, %rax
//	movl	$16, %esi
//	movl	$0, %edx
//	divq	%rsi
//	imulq	$16, %rax, %rax
//	subq	%rax, %rsp
//	movq	%rsp, %rax
//	addq	$15, %rax
//	shrq	$4, %rax
//	salq	$4, %rax
//	movq	%rax, -24(%rbp)
//	.loc 1 24 0
//	movl	$1024, %edi
//	call	malloc
