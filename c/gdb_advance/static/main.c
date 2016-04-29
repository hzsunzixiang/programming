#include <stdio.h>

int main()
{
	int x = 0x111;
	int y = 0x222;
	int z = 0;

	{
		int x = 0x333;
		int y = 0x444;
		z = x + y;
	}


	return 0;
}
// http://stackoverflow.com/questions/8692128/static-option-for-gcc
// 添加static 的目标文件大了很多
// -rwxr-xr-x 1 stephensun root 812K Apr 29 23:49 main
// -rw-r--r-- 1 stephensun root  146 Apr 29 23:48 main.c
// -rwxr-xr-x 1 stephensun root  28K Apr 29 23:48 main_non


// stephensun@debian:~/programming/c/gdb_advance/static$ size  main main_non
//    text    data     bss     dec     hex filename
//  733026    7340    8824  749190   b6e86 main
//    1163     552       8    1723     6bb main_non
// 
