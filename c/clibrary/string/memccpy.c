
#include <string.h>

void *
memccpy(void *t, const void *f, int c, size_t n)
{

	if (n) {
		unsigned char *tp = t;
		const unsigned char *fp = f;
		unsigned char uc = c;
		do {
			if ((*tp++ = *fp++) == uc)
				return (tp);
		} while (--n != 0);
	}
	return (0);
}
