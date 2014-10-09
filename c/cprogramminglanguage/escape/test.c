#include <stdio.h> 
#include <string.h> 

int main()
{
		char s[100] = "this quote \" this is breakline \n and backtrace \b  and ";
		char t[100] ;
		printf("sizeof(s)\t%d\n",sizeof(s));
		printf("strlen(s)\t%d\n",strlen(s));
		return 0;
}
