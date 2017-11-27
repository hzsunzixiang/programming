/* memcpy example */
// http://www.cplusplus.com/reference/cstring/memcpy/
#include <stdio.h>
#include <string.h>


//
char* strcpy(char* des,const char* source)
{
	if((des == NULL) || (source == NULL))
		return NULL;
	char* r=des;
	while((*r++ = *source++)!='\0');
	return des;
}

// 展开版
char* strcpy1(char* des,const char* source)
{
	if((des == NULL) || (source == NULL))
		return NULL;
	char* r=des;
	//while((*r++ = *source++)!='\0');
	while( 1 )
	{ 
		char temp = *source;   // 不能放下面
		*r = *source; 
		r++; 
		source++; 
		if( '\0' == temp )
			break;
	}
	return des;
}

// 展开版
char* strcpy2(char* des,const char* source)
{
	if((des == NULL) || (source == NULL))
		return NULL;
	char* r=des;
	//while((*r++ = *source++)!='\0');
	while ( *source!= '\0' )
	{
		*r++ = *source++;
	}
	*r='\0';   //  这个很关键
	return des;
}



int main(){
	char srcString[30]="Hello World!";
	//char trgtString[30]={0};
	char trgtString[30]={0};
	memset(trgtString, '-', 30);
	//char *trgtString  = NULL;

	strcpy2(trgtString, srcString);
	printf("Source String: %s\n",srcString);
	printf("Target String: %s\n",trgtString);

	return 0;
}
