// char *  itoa ( int value, char * str, int base );
// Convert integer to string (non-standard function)
// Converts an integer value to a null-terminated string using the specified base and stores the result in the array given by str parameter.
// 
// If base is 10 and value is negative, the resulting string is preceded with a minus sign (-). With any other base, value is always considered unsigned.
// 
// str should be an array long enough to contain any possible value: (sizeof(int)*8+1) for radix=2, i.e. 17 bytes in 16-bits platforms and 33 in 32-bits platforms.
// This function is not defined in ANSI-C and is not part of C++, but is supported by some compilers.
// 
// A standard-compliant alternative for some cases may be sprintf:
// sprintf(str,"%d",value) converts to decimal base.
// sprintf(str,"%x",value) converts to hexadecimal base.
// sprintf(str,"%o",value) converts to octal base.


/* itoa example */
#include <stdio.h>
#include <stdlib.h>

int main ()
{
	int i;
	char buffer [33];
	printf ("Enter a number: ");
	scanf ("%d",&i);
	itoa (i,buffer,10);
	printf ("decimal: %s\n",buffer);
	itoa (i,buffer,16);
	printf ("hexadecimal: %s\n",buffer);
	itoa (i,buffer,2);
	printf ("binary: %s\n",buffer);
	return 0;
}

