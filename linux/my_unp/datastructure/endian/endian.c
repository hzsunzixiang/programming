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




//   0x0102
//   大端 高地址存储高位
//   小端 高地址存储低位
//   
//                                          大端          小端
//   
//   
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
//   V                                      |   |        |   |    
//                                                     
//   地址增大方向，                                                
//   栈生长方向                                        
//                     
