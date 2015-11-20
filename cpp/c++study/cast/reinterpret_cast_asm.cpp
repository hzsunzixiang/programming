int main()
{
	int i = 0x0107;

	char* p2 = reinterpret_cast<char*>(&i);

	char p1 = *p2 + 1;

	reinterpret_cast<unsigned int&>(i) = 42;

	i = i + 2;

}


// 描述的不太确切， 可以看得出来 强制转换  使用的是movzbl 指令 
//	subl	$16, %esp
//	movl	$263, -12(%ebp)
//	leal	-12(%ebp), %eax
//	movl	%eax, -4(%ebp)   // 把i存放 到 -4(%ebp)
//	movl	-4(%ebp), %eax   // i的地址值放入eax
//	movzbl	(%eax), %eax     // i的值以字节的形式放入eax
//	addl	$1, %eax         // eax + 1
//	movb	%al, -5(%ebp)    // 放入p1 
//	leal	-12(%ebp), %eax
//	movl	$42, (%eax)      // 把42 放入 eax中 存放i
//	movl	-12(%ebp), %eax  // 
//	addl	$2, %eax           // 
//	movl	%eax, -12(%ebp)
//	movl	$0, %eax
//







