#include <wchar.h>

wchar_t	*
wmemset(wchar_t *s, wchar_t c, size_t n)
{
	size_t i;
	wchar_t *p;

	p = s;
	for (i = 0; i < n; i++) {
		*p = c;
		p++;
	}
	return s;
}
