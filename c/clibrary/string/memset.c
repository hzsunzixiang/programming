#include <string.h>

void *
memset(void *dst, int c, size_t n)
{
	if (n != 0) {
		unsigned char *d = dst;

		do
			*d++ = (unsigned char)c;
		while (--n != 0);
	}
	return (dst);
}


void
bzero(void *b, size_t length)
{
	char *p;

	for (p = b; length--;)
		*p++ = '\0';
}
