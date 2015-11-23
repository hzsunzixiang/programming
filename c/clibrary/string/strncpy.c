
#if !defined(_KERNEL) && !defined(_STANDALONE)
#include <string.h>
#else
#include <lib/libkern/libkern.h>
#endif

/*
 * Copy src to dst, truncating or null-padding to always copy n bytes.
 * Return dst.
 */
	char *
strncpy(char *dst, const char *src, size_t n)
{
	if (n != 0) {
		char *d = dst;
		const char *s = src;

		do {
			if ((*d++ = *s++) == 0) {
				/* NUL pad the remaining n-1 bytes */
				while (--n != 0)
					*d++ = 0;
				break;
			}
		} while (--n != 0);
	}
	return (dst);
}

char *strncpy(char *s, const char *ct, size_t n) {

	char *saver = s;

	while(n--)  // 这里有漏洞 如果源字符串较短 n 较大 , 似乎应该终止
		*saver++ = *ct++;
	*saver = '\0';

	return s;
}
