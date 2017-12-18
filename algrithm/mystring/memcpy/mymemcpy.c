// MEMCPY(3)                                                                       Linux Programmer's Manual                                                                       MEMCPY(3)
// NAME
//        memcpy - copy memory area
// SYNOPSIS
//        #include <string.h>
//        void *memcpy(void *dest, const void *src, size_t n);
// 
// DESCRIPTION
//        The memcpy() function copies n bytes from memory area src to memory area dest.  The memory areas must not overlap.  Use memmove(3) if the memory areas do overlap.
// RETURN VALUE
//        The memcpy() function returns a pointer to dest.
// ATTRIBUTES
//    Multithreading (see pthreads(7))
//        The memcpy() function is thread-safe.
// CONFORMING TO
//        SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
// SEE ALSO
//        bcopy(3), memccpy(3), memmove(3), mempcpy(3), strcpy(3), strncpy(3), wmemcpy(3)
// COLOPHON
//        This  page  is  part  of release 3.74 of the Linux man-pages project.  A description of the project, information about reporting bugs, and the latest version of this page, can be
//        found at http://www.kernel.org/doc/man-pages/.

// A C implementation of memcpy()
#include<stdio.h>
#include<string.h>

//        void *memcpy(void *dest, const void *src, size_t n);
void myMemCpy(void *dest, const void *src, size_t n)
{
	// Typecast src and dest addresses to (char *)
	char *csrc = (char *)src;
	char *cdest = (char *)dest;

	// Copy contents of src[] to dest[]
	for (int i=0; i<n; i++)
		cdest[i] = csrc[i];
}

// Driver program
int main()
{
	char csrc[] = "GeeksforGeeks";
	char cdest[100];
	memset (cdest, '-', 40);
	//myMemCpy(cdest, csrc, strlen(csrc));  // 这样会有问题
	myMemCpy(cdest, csrc, strlen(csrc)+1);
	printf("Copied string is %s", cdest);

	int isrc[] = {10, 20, 30, 40, 50};
	int n = sizeof(isrc)/sizeof(isrc[0]);
	int idest[n], i;
	myMemCpy(idest, isrc,  sizeof(isrc));
	printf("\nCopied array is ");
	for (i=0; i<n; i++)
		printf("%d ", idest[i]);
	printf("\n");
	return 0;
}






