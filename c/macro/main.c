
#include <stdio.h>


int print_fun();
int main()
{
	printf("%s(%d)-%s: this is main\n",__FILE__,__LINE__,__FUNCTION__);
	print_fun() ;
	return 0;
}
// int print_fun()
// {
//  printf("%s(%d)-%s: %s, this is print_fun\n","lib/print_fun.c",7,__FUNCTION__, __func__);
//  return 0;
// }


// 汇编
// __FUNCTION__.1803:
// 	.string	"main"
// 	.text

//__FUNCTION__.1802:
//	.string	"print_fun"
//	.type	__func__.1803, @object
//	.size	__func__.1803, 10
//__func__.1803:
//	.string	"print_fun"
//	.text
