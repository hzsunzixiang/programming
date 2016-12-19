#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
	printf("hello,\
			world\n");
	printf("hello,\
world\n");
	return 0;
}


//stephensun@debian:~/programming/c/printf$ ./main_backslash
//hello,                  world
//hello,world

