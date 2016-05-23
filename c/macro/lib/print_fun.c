
#include <stdio.h>


int print_fun()
{
	printf("%s(%d)-%s: %s, this is print_fun\n",__FILE__,__LINE__,__FUNCTION__, __func__);
	return 0;
}
