#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

       // z      A following integer conversion corresponds to a size_t or ssize_t argument, or a following n conversion corresponds to a pointer to a size_t argument.

       // t      A following integer conversion corresponds to a ptrdiff_t argument, or a following n conversion corresponds to a pointer to a ptrdiff_t argument.
int main()
{
	size_t a = -25;
	ssize_t b = -30;
	printf("%zu\t%zu\n", a, b);
	printf("%zd\t%zd\n", a, b);
	printf("%zu\t%zd\n", a, b);
	printf("%zd\t%zu\n", a, b);
	return 0;
}

// 看预编译文件format_zd.i

//typedef long unsigned int size_t;
//typedef long int __ssize_t;
//typedef __ssize_t ssize_t;

//size_t is declared as unsigned int so it can't represent negative value.
//So there is ssize_t which is the signed type of size_t 

//size_t or ssize_t 
//https://stackoverflow.com/questions/15739490/should-use-size-t-or-ssize-t


//https://stackoverflow.com/questions/12175358/c-size-t-and-ssize-t-negative-value
