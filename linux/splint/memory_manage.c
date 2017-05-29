#include <stdio.h> 
#include <stdlib.h> 
//

//当有其他指针引用当时候，释放一块空间
void memory_management(void) 
{ 

	int *a = (int *)malloc(sizeof(int)); 
	int *b = a; 
	free(a); 
	*b = 0; 
}
// stephensun@debian:~/programming/linux/splint$ splint memory_manage.c
// Splint 3.1.2 --- 20 Feb 2009
// 
// memory_manage.c: (in function memory_management)
// memory_manage.c:12:3: Variable b used after being released
//   Memory is used after it has been released (either by passing as an only param
//   or assigning to an only global). (Use -usereleased to inhibit warning)
//    memory_manage.c:11:7: Storage b released
// memory_manage.c:12:3: Dereference of possibly null pointer b: *b
//   A possibly null pointer is dereferenced.  Value is either the result of a
//   function which may return null (in which case, code should check it is not
//   null), or a global, parameter or structure field declared with the null
//   qualifier. (Use -nullderef to inhibit warning)
//    memory_manage.c:10:11: Storage b may become null
// 
// Finished checking --- 2 code warnings
// 
