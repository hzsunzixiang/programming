#include <stdio.h>



int Fibonacci(int n)
{
	if ( n == 0 )
		return 0;
	else if ( n == 1 )
		return 1;
	else
		return ( Fibonacci(n-1) + Fibonacci(n-2) );
} 

int main()
{
	int x = Fibonacci(5);
	printf("%d\n", x);
	return 0;
}



/*
//                             F(5)
//                            /    \
//                           /      \
//                          /	     \
//                         /          \
//                        /            \
//                       /              \
//				       F(4)             F(3)                                   
//                    /    \            /   \
//                   /      \          /     \
//			   	   F(3)	  F(2) 	     F(2)    F(1)	
//                /  \     /  \      /  \
//               /    \	  /    \    /    \
//            F(2)  F(1) F(1) F(0)  F(1)  F(0)  
//             / \
//            /   \
//          F(1) F(0)   
//				
					 
*/
//	deal with n:5                                                                      
//	deal with n:4                                                                         
//	deal with n:3                                                                         
//	deal with n:2                                                                         
//	deal with n:---1                                                                      
//	ret L4 ---  ebp:0xbffff188, eax:1                                                        
//	deal with n:---0                                                                      
//	ret L4 ---  ebp:0xbffff188, eax:0         计算 f(2) = f(1) + f(0)  // 最最下角 F(2) 
//
//	ret L4 ---  ebp:0xbffff1a8, eax:1         f(2) = f(1) + f(0)  //   左边的的值                                             
//	deal with n:---1                                                                      
//	ret L4 ---  ebp:0xbffff1a8, eax:1         f(1)  // 组成F(3) 的右节点
//	                                                 
//	ret L4 ---  ebp:0xbffff1c8, eax:2         f(3) = f(2) + f(1)   
//	                                              
//	deal with n:2                                                                         
//	deal with n:---1                                                                      
//	ret L4 ---  ebp:0xbffff1a8, eax:1                                                     
//	deal with n:---0                                                                      
//	ret L4 ---  ebp:0xbffff1a8, eax:0         
//	                                             
//	ret L4 ---  ebp:0xbffff1c8, eax:1        f(2) = f(1) + f(0) // 组成F(4) 的右节点
//	                                                 
//	ret L4 ---  ebp:0xbffff1e8, eax:3         返回f(4)  
//	                                          
//	deal with n:3                             f(5) = f(4) + f(3)    // 现在计算f(3)
//	deal with n:2                                                                         
//	deal with n:---1                                                                      
//	ret L4 ---  ebp:0xbffff1a8, eax:1          计算f(1)                                                
//	deal with n:---0                                                                      
//	ret L4 ---  ebp:0xbffff1a8, eax:0         计算f(0)
//	                                     
//	ret L4 ---  ebp:0xbffff1c8, eax:1         计算返回出f(2)  右分支的F(2)
//	                                          
//	deal with n:---1                                                                  
//	ret L4 ---  ebp:0xbffff1c8, eax:1         返回f(1) 右分支 F(3) 的左节点
//	ret L4 ---  ebp:0xbffff1e8, eax:2         计算返回出f(3)
//	                                                  
//	ret L4 ---  ebp:0xbffff218, eax:5         返回f(5) = f(4) + f(3)        
//					 
					          



























