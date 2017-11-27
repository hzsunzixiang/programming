/* memcpy example */
// http://www.cplusplus.com/reference/cstring/memcpy/
#include <stdio.h>
#include <string.h>

int main(){
	char srcString[30]="Hello World!";
	char *trgtString  = NULL;

	// 标准库里面的也会报错
	strcpy(trgtString, srcString);
	printf("Source String: %s\n",srcString);
	printf("Target String: %s\n",trgtString);

	return 0;
}
