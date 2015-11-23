
#if !defined(_KERNEL) && !defined(_STANDALONE)
#include <string.h>
#else
#include <lib/libkern/libkern.h>
#endif

/*
 * bcmp -- vax cmpc3 instruction
 */
int
bcmp(const void *b1, const void *b2, size_t length)
{
	char *p1, *p2;

	if (length == 0)
		return (0);
	p1 = (char *)b1;
	p2 = (char *)b2;
	do
		if (*p1++ != *p2++)
			return (1);
	while (--length);
	return (0);
}
