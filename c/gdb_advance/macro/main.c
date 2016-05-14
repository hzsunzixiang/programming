#include <stdio.h>
#include "sample.h"

#define M 42
#define ADD(x) (M + x)

int main ()
{
#define N 28
	printf ("Hello, world!\n");
#undef N
	printf ("We're so creative.\n");
#define N 1729
	printf ("Goodbye, world!\n");

	return 0;
}



// -g3 "includes extra information such as macro definitions. Some debuggers support macro expansion when you use -g3", while -g does not.
// 
// The broader answer is that gcc supports four levels of debug information, from -g0 (debug information disabled) through -g3 (maximum debug information).
// 
// Specifying -g is equivalent to -g2. Curiously, the gcc docs say little about what information -g/-g2 includes or excludes.
// 
//     Request debugging information and also use level to specify how much information. The default level is 2. Level 0 produces no debug information at all. Thus, -g0 negates -g.
// 
//     Level 1 produces minimal information, enough for making backtraces in parts of the program that you don't plan to debug. This includes descriptions of functions and external variables, and line number tables, but no information about local variables.
// 
//     Level 3 includes extra information, such as all the macro definitions present in the program. Some debuggers support macro expansion when you use -g3.
// 


//     (gdb) info macro __STDC__
//     Defined at /home/jimb/gdb/macros/play/sample.c:0
//     -D__STDC__=1
//     (gdb)

// (gdb)  info macro __STDC__
// Defined at /home/stephensun/programming/c/gdb_advance/macro/main.c:1
// #define __STDC__ 1
// 
