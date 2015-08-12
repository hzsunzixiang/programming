#include <stdio.h>


int global; /* Uninitialized variable stored in bss*/
int global_i = 10; /* initialized global variable stored in DS*/

int main(void)
{
	static int i; /* Uninitialized static variable stored in bss */
	static int i_i = 100; /* Initialized static variable stored in DS*/
	return 0;
}



//root@debian32-1:~/programming/linux/my_apue/memory_layout# size  -B size_of_use
//   text    data     bss     dec     hex filename
//   1033     276       8    1317     525 size_of_use

