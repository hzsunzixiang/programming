#include<stdio.h>
#include<stdlib.h>

	int
main(int argc, char **argv)
{
	union {
		short  s;
		char   c[sizeof(short)];
	} un;

	un.s = 0x0102;
	if (sizeof(short) == 2) {
		if (un.c[0] == 1 && un.c[1] == 2)
			printf("big-endian\n");
		else if (un.c[0] == 2 && un.c[1] == 1)
			printf("little-endian\n");
		else
			printf("unknown\n");
	} else
		printf("sizeof(short) = %ld\n", sizeof(short));

	exit(0);
}


//什么是大端和小端
//        Big-Endian和Little-Endian的定义如下：
//1) Little-Endian就是低位字节排放在内存的低地址端，高位字节排放在内存的高地址端。
//2) Big-Endian就是高位字节排放在内存的低地址端，低位字节排放在内存的高地址端。
//举一个例子，比如数字0x12 34 56 78在内存中的表示形式为：
//1)大端模式：
//低地址 -----------------> 高地址
//0x12  |  0x34  |  0x56  |  0x78
//2)小端模式：
//低地址 ------------------> 高地址
//0x78  |  0x56  |  0x34  |  0x12
//可见，大端模式和字符串的存储模式类似。

//   0x0102
//   小端 高地址存储高位
//   大端 高地址存储低位
//   
//                                          大端          小端
//   地址增大方向，                                                
//   栈生长方向                                        

//   ^ 
//   |                                      |   |        |   |    
//   |                                      -----        -----    
//   |                                      | 02|        | 01|    
//   |									    -----	     -----			
//   |                                      | 01|        | 02|      
//   |								        -----        -----    
//   |                                      |   |        |   |    
//   |                                      |   |        |   |    
//   |                                      |   |        |   |    
//   |                                      |   |        |   |    
//                                          |   |        |   |    
//                                                     

