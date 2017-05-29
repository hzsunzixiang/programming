#include <stdio.h> 

 

int func_null_point(void) 

{ 
	int *a = NULL; 
	return *a; 
}  
// stephensun@debian:~/programming/linux/splint$ splint null_points.c
// Splint 3.1.2 --- 20 Feb 2009
// 
// null_points.c: (in function func_null_point)
// null_points.c:9:10: Dereference of null pointer a: *a
//   A possibly null pointer is dereferenced.  Value is either the result of a
//   function which may return null (in which case, code should check it is not
//   null), or a global, parameter or structure field declared with the null
//   qualifier. (Use -nullderef to inhibit warning)
//    null_points.c:8:11: Storage a becomes null
// 
// Finished checking --- 1 code warning
// 
