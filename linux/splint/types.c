#include <stdio.h> 

void splint_types(void) 
{ 

	short a = 0; 

	long b = 32768; 
	a = b; 
}


// stephensun@debian:~/programming/linux/splint$ splint types.c
// Splint 3.1.2 --- 20 Feb 2009
// 
// types.c: (in function splint_types)
// types.c:9:2: Assignment of long int to short int: a = b
//   To ignore type qualifiers in type comparisons use +ignorequals.
// 
// Finished checking --- 1 code warning



