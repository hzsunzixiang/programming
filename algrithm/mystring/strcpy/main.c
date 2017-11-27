/* memcpy example */
// http://www.cplusplus.com/reference/cstring/memcpy/
#include <stdio.h>
#include <string.h>



//C - Implement String Copy using Pointer (strcpy using pointer) using C Program.
#include <stdio.h>

//function to copy string using pointer
//Author: www.includehelp.com
// https://www.daniweb.com/programming/software-development/threads/317557/strcpy-using-pointers

char *xstrcpy(char *q, const char *p)
{
	char* dst = q;
	while(*p != '\0') {
		*q = *p;
		p++;
		q++;
	}
	*q = '\0';
	return dst; 
}
char *string_copy(char* target, const char* source){
	char *ptr = target;
	while((*target=*source)){
		target++;
		source++;
	}
	return ptr;
}
//https://stackoverflow.com/questions/13460934/strcpy-using-pointers

char* mystrcpy(char *dst, const char *src) {
	char *ptr = dst;
	while ((*dst++ = *src++) ) ;
	return ptr;
}
//
//C语言标准库函数strcpy的一种典型的工业级的最简实现。
 
//返回值：目标串的地址。
 
//对于出现异常的情况ANSI-C99标准并未定义，故由实现者决定返回值，通常为NULL。
 
//参数：des为目标字符串，source为原字符串。
 
 
 
char* strcpy(char* des,const char* source)
{
	if((des == NULL) || (source == NULL))
		return NULL;
	char* r=des;
	while((*r++ = *source++)!='\0');
	return des;
}

int main(){
	char srcString[30]="Hello World!";
	//char trgtString[30]={0};
	//char trgtString[30]={0};
	char *trgtString  = NULL;

	//copy string
	//string_copy(trgtString, srcString);
	//mystrcpy(trgtString, srcString);
	strcpy(trgtString, srcString);
	printf("Source String: %s\n",srcString);
	printf("Target String: %s\n",trgtString);

	return 0;
}
