// MEMMOVE(3)                                                                      Linux Programmer's Manual                                                                      MEMMOVE(3)
// NAME
//        memmove - copy memory area
// SYNOPSIS
//        #include <string.h>
//        void *memmove(void *dest, const void *src, size_t n);
// DESCRIPTION
//        The  memmove()  function  copies  n bytes from memory area src to memory area dest.  The memory areas may overlap: copying takes place as though the bytes in src are first copied
//        into a temporary array that does not overlap src or dest, and the bytes are then copied from the temporary array to dest.
// RETURN VALUE
//        The memmove() function returns a pointer to dest.
// ATTRIBUTES
//    Multithreading (see pthreads(7))
//        The memmove() function is thread-safe.
// CONFORMING TO
//        SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
// SEE ALSO
//        bcopy(3), memccpy(3), memcpy(3), strcpy(3), strncpy(3), wmemmove(3)
// COLOPHON
//        This page is part of release 3.74 of the Linux man-pages project.  A description of the project, information about reporting bugs, and the latest version of  this  page,  can  be
//        found at http://www.kernel.org/doc/man-pages/.
// GNU                                                                                     2014-03-17                                                                             MEMMOVE(3)



//C++ program to demonstrate implementation of memmove()
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

// // A function to copy block of 'n' bytes from source
// // address 'src' to destination address 'dest'.
// void myMemMove(void *dest, void *src, size_t n)
// {
// 	// Typecast src and dest addresses to (char *)
// 	char *csrc = (char *)src;
// 	char *cdest = (char *)dest;
// 
// 	// Create a temporary array to hold data of src
// 	//char *temp = new char[n];
// 	char *temp = (char *)malloc(n);
// 
// 	// Copy data from csrc[] to temp[]
// 	for (int i=0; i<n; i++)
// 		temp[i] = csrc[i];
// 
// 	// Copy data from temp[] to cdest[]
// 	for (int i=0; i<n; i++)
// 		cdest[i] = temp[i];
// 
// 	free(temp);
// 	//delete [] temp;
// }

// https://aticleworld.com/memmove-function-implementation-in-c/
void *
myMemMove(void *pvDst, const void *pvSrc, unsigned int n) {

	unsigned char u8CopyByte=1;  //flag bit
	char *pcSource =(char *)pvSrc;
	char *pcDstn =(char *)pvDst;

	if(pcSource == pcDstn) { //Source & destination have same address
		return pvDst;

	} else if(pcSource < pcDstn && pcDstn < pcSource + n) { // overlap

		/* If overlap then copy from end*/
		pcSource += n;
		pcDstn += n;

	}
	else
	{
		u8CopyByte=0;
	}
	if(u8CopyByte) {

		while(n--)
			*--pcDstn = *--pcSource;
	}
	else
	{
		memcpy (pvDst, pvSrc, n);   // 注意这里是sizeof 是有 0 字符长度的
	}

	return pvDst;
}

// Driver program
int main()
{
	char csrc[100] = "Geeksfor";
	myMemMove(csrc+5, csrc, strlen(csrc)+1);
	printf("%s\n", csrc);

 	char csrc1[] = "GeeksforGeeks";
 	char cdest[100];

 	memset (cdest, '-', 40);
 	myMemMove(cdest, csrc1, strlen(csrc1)+1);
 	printf("Copied string is %s", cdest);
	return 0;
}
