
#include <string.h>

/*
 * Find the first occurrence of find in s.
 */
	char *
strstr(const char *s, const char *find)
{
	char c, sc;
	size_t len;

	if ((c = *find++) != 0) {
		len = strlen(find);
		do {
			do {
				if ((sc = *s++) == 0)
					return (NULL);
			} while (sc != c);
		} while (strncmp(s, find, len) != 0);
		s--;
	}
	return ((char *)s);
}




//1.Copyright 1990 Software Development Systems, Inc.
char *strstr(const char *s1,const char *s2)
{
	int len2;
	if (!(len2 = strlen(s2)))//此种情况下s2不能指向空，否则strlen无法测出长度，这条语句错误
		return(char*)s1;
	for(; *s1; ++s1)
	{
		if(*s1 == *s2 && strncmp(s1, s2, len2)==0)
			return(char*)s1;
	}
	return NULL;
}


char *strstr(const char*s1,const char*s2)
{
	int n;
	if(*s2)
	{
		while(*s1)
		{
			for(n=0; *(s1 + n) == *(s2 + n); n++)
			{
				if(!*(s2 + n +1))
					return(char*)s1;
			}
			s1++;
		}
		return NULL;
	}
	else
		return (char*)s1;
}



char *strstr(const char*s1,const char*s2)
{
	const char*p=s1;
	const size_tlen=strlen(s2);
	for(; (p = strchr(p, *s2)) != 0; p++)
	{
		if(strncmp(p, s2, len)==0)
			return (char*)p;
	}
	return(0);
}




