#include <stdlib.h> 
#include <stdio.h> 

void bounds1(void ) 
{ 

	int a[10]; 

	a[10]=0; 
}


// stephensun@debian:~/programming/linux/splint$ splint  +bounds buffersize.c
// Splint 3.1.2 --- 20 Feb 2009
// 
// buffersize.c: (in function bounds1)
// buffersize.c:9:2: Likely out-of-bounds store: a[10]
//     Unable to resolve constraint:
//     requires 9 >= 10
//      needed to satisfy precondition:
//     requires maxSet(a @ buffersize.c:9:2) >= 10
//   A memory write may write to an address beyond the allocated buffer. (Use
//   -likelyboundswrite to inhibit warning)
// 
// Finished checking --- 1 code warning

