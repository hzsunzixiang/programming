


// Sample program to show that memcpy() can loose data.
#include <stdio.h>
#include <string.h>
int main()
{
	char csrc[100] = "Geeksfor";
	//memcpy(csrc+5, csrc, strlen(csrc)+1);
	memmove(csrc+5, csrc, strlen(csrc)+1);
	printf("%s", csrc);
	return 0;
}



//// Sample program to show that memmove() is better than memcpy()
//// when addresses overlap.
//#include <stdio.h>
//#include <string.h>
//int main()
//{
//	char csrc[100] = "Geeksfor";
//	memmove(csrc+5, csrc, strlen(csrc)+1);
//	printf("%s", csrc);
//	return 0;
//}
