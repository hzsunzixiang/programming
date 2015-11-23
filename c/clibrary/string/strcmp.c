
#if !defined(_KERNEL) && !defined(_STANDALONE)
#include <string.h>
#else
#include <lib/libkern/libkern.h>
#endif

/*
 * Compare strings.  这个不太好理解
 */
	int
strcmp(const char *s1, const char *s2)
{
	while (*s1 == *s2++)
		if (*s1++ == 0)
			return (0);
	return (*(unsigned char *)s1 - *(unsigned char *)--s2);
}

int strcmp(const char *str1,const char *str2)
{
	/*不可用while(*str1++==*str2++)来比较，当不相等时仍会执行一次++，
	 *     return返回的比较值实际上是下一个字符。应将++放到循环体中进行。*/
	while(*str1 == *str2)
	{
		if(*str1 == '\0')
			return0;

		str1++;
		str2++;
	}
	return *str1 - *str2;
}

int(const char *pl,const char *p2)
{
	const unsignedchar *s1 = (const unsigned char*)p1;
	const unsignedchar *s2 = (const unsigned char*)p2;
	unsigned reg_charc1, c2;
	do{
		c1 = (unsigned char)*s1++;
		c2 = (unsigned char)*s2++;
		if(c1 == '\0')
			return c1 - c2;
	}while(c1 == c2);
	return c1 - c2;
} 
// libc_hidden_builtin_def(strcmp)
int(const char *sl,const char *s2)
{
	/*compare unsigned char sl[],s2[]*/
	for(; *sl == *s2; ++sl, ++s2)
		if(*sl == '\0')
			return(0);
	return((*(unsigned char*)sl < *(unsigned char*)s2) ? -1 : +1);
}


// strcmp另外的源代码如下：

int __cdecl strcmp(const char *src,const char *dst)
{
	int ret=0;
	while(!(ret = *(unsigned char *)src - *(unsigned char *)dst) && *dst)
		++src,++dst;
	if(ret < 0)
		ret = -1;
	else if(ret > 0)
		ret = 1;
	return(ret);
}
