
#if !defined(_KERNEL) && !defined(_STANDALONE)
#include <string.h>
#else
#include <lib/libkern/libkern.h>
#endif

/*
 * bzero -- vax movc5 instruction
 */
void
bzero(void *b, size_t length)
{
	char *p;

	for (p = b; length--;)
		*p++ = '\0';
}
