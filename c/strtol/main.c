#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>

int main (int argc, char **argv)
{
	if (argc < 2) {
		fprintf (stderr, "\n Error: insufficient input. Usage: %s int [int (base)]\n\n", argv[0]);
		return 1;
	}

	const char *nptr = argv[1];                     /* string to read               */
	char *endptr = NULL;                            /* pointer to additional chars  */
	int base = (argc > 2) ? atoi (argv[2]) : 10;    /* numeric base (default 10)    */
	long number = 0;                                /* variable holding return      */

	/* reset errno to 0 before call */
	errno = 0;

	/* call to strtol assigning return to number */
	number = strtol (nptr, &endptr, base );

	/* output original string of characters considered */
	printf ("\n string : %s\n base   : %d\n endptr : %s\n\n", nptr, base, endptr);

	/* test return to number and errno values */
	if (nptr == endptr)
		printf (" number : %lu  invalid  (no digits found, 0 returned)\n", number);
	else if (errno == ERANGE && number == LONG_MIN)
		printf (" number : %lu  invalid  (underflow occurred)\n", number);
	else if (errno == ERANGE && number == LONG_MAX)
		printf (" number : %lu  invalid  (overflow occurred)\n", number);
	else if (errno == EINVAL)  /* not in all c99 implementations - gcc OK */
		printf (" number : %lu  invalid  (base contains unsupported value)\n", number);
	else if (errno != 0 && number == 0)
		printf (" number : %lu  invalid  (unspecified error occurred)\n", number);
	else if (errno == 0 && nptr && !*endptr)
		printf (" number : %lu    valid  (and represents all characters read)\n", number);
	else if (errno == 0 && nptr && *endptr != 0)
		printf (" number : %lu    valid  (but additional characters remain)\n", number);

	printf ("\n");

	return 0;
}
