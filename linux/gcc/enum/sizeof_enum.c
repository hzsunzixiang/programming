#include <stdio.h>

enum result_t {
	RESULT_INT    = 11111,
	RESULT_DOUBLE = 22222,
	RESULT_SHORT  = 33333,
};

enum result_l {
	RESULT_LONG1 = 0,
	RESULT_LONG2 = 4294967296 + 100,
	RESULT_LONG3 = 4294967296 + 200,
};

int main()
{

	enum result_t  ei1;
	enum result_l  el1 = RESULT_LONG1; 

	printf("sizeof(enum result_t):%d\n", sizeof(ei1));
	printf("sizeof(enum result_l):%d\n", sizeof(el1));
	return 0;
}

// root@centos-1:~/programming/linux/gcc/enum# ./sizeof_enum
// sizeof(enum result_t):4
// sizeof(enum result_l):8

