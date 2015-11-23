
#if !defined(_KERNEL) && !defined(_STANDALONE)
#include <string.h>
#else
#include <lib/libkern/libkern.h>
#endif

#if defined(APIWARN)
__warn_references(strcpy,
		"warning: strcpy() is almost always misused, please use strlcpy()");
#endif

	char *
strcpy(char *to, const char *from)
{
	char *save = to;

	for (; (*to = *from) != '\0'; ++from, ++to);
	return(save);
}



char* strcpy(char* des, const char* source)
{
	char *r = des;

	assert((des != NULL) && (source != NULL));

	while((*des++ = *source++)!='\0');

	return r;
}




char *strcpy(char *strDes, const char *strSrc)
{

	assert(strSrc != NULL); 
	//若strSrc为NULL，则抛出异常。

	strDes = (char *)malloc(strlen(strSrc) + 1);
	//多一个空间用来存储字符串结束符'\0'

	char *p=strDes;

	while(*strSrc != '\0')
	{

		*p++ = *strSrc++;

	}

	*p='\0';

	return strDes;

}




