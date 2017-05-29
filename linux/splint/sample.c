#include <stdlib.h> 



int func_splint_msg1(void) 
{ 
	int a; 
	return 0; 
} 

int func_splint_msg2(void) 
{ 

	int *a = (int*)malloc(sizeof(int)); 
	a = NULL; 
	return 0;
}

// stephensun@debian:~/programming/linux/splint$ splint sample.c
// Splint 3.1.2 --- 20 Feb 2009
// 
// sample.c: (in function func_splint_msg1)
// sample.c:7:6: Variable a declared but not used
//   A variable is declared but never used. Use /*@unused@*/ in front of
//   declaration to suppress message. (Use -varuse to inhibit warning)
// sample.c: (in function func_splint_msg2)
// sample.c:15:2: Fresh storage a (type int *) not released before assignment:
//                   a = NULL
//   A memory leak has been detected. Storage allocated locally is not released
//   before the last reference to it is lost. (Use -mustfreefresh to inhibit
//   warning)
//    sample.c:14:37: Fresh storage a created
// 
// Finished checking --- 2 code warnings

