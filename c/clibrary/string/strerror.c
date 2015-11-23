
#include <string.h>
#include <limits.h>

char *
strerror(int num)
{
	static char buf[NL_TEXTMAX];

	(void)strerror_r(num, buf, sizeof(buf));
	return (buf);
}
