#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include <arpa/inet.h>
//http://mjfrazer.org/mjfrazer/bitfields/
// 大小端字节对 bit filed的解释不一样


	int
main(int argc, char **argv)
{
	union {
		short  s;
		struct iphdr {
			uint8_t ihl:4,     
					version:4;

			uint8_t padding;
		}iph1;
	}un;
	un.iph1.ihl = 0x02;  // 0010
	un.iph1.version = 0xa;  // 1010
	un.iph1.padding = 0x0;  //  00000000 
	// 0010 1010 0000 0000 
	printf("ihl:%0X, version:%0X, padding:%0X,  s:%0hX\n", un.iph1.ihl, un.iph1.version, un.iph1.padding, un.s);
	// ihl:2, version:A, padding:0,  s:A2
	un.s = htons(un.s);

	printf("ihl:%0X, version:%0X, padding:%0X,  s:%0hX\n", un.iph1.ihl, un.iph1.version, un.iph1.padding, un.s);
	// ihl:0, version:0, padding:A2,  s:A200
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

//                     







