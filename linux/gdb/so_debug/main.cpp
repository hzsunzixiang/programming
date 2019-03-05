/************关于本文档********************************************
 *filename: pk.cpp
 *********************************************************************/
#include <stdio.h>
#include "get.h"

int g_x = 0x111;
int main (int argc, char** argv)
{
	int a = 100;
	static int s_x = 0x3333;
	int b = get ();
	int c = set (a);
	int d = get ();


	printf ("a=%d,b=%d,c=%d,d=%d\n",a,b,c,d);

	return 0;
}
