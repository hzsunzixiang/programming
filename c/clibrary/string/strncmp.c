

#if !defined(_KERNEL) && !defined(_STANDALONE)
#include <string.h>
#else
#include <lib/libkern/libkern.h>
#endif

	int
strncmp(const char *s1, const char *s2, size_t n)
{

	if (n == 0)
		return (0);
	do {
		if (*s1 != *s2++)
			return (*(unsigned char *)s1 - *(unsigned char *)--s2);
		if (*s1++ == 0)
			break;
	} while (--n != 0);
	return (0);
}



int custom_strncmp(const char *s, const char *t, size_t n) {
	while(n--) {
		if(*s != *t) {
			return *s - *t;
		}
		else {
			++s;
			++t;
		}
	}

	return 0;
}
