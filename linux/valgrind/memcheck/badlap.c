
#include <stdlib.h>
#include <stdio.h>
#include <string.h>



int main()
{
	char x[50];
	int i;
	for (i = 0; i < 50; i++)
	{
		x[i] = i + 1;
	}
	
	//        char *strncpy(char *dest, const char *src, size_t n);

	strncpy(x+20, x, 20);
	strncpy(x+20, x, 21); // overlap
	strncpy(x, x+20, 20); 
	strncpy(x, x+20, 21); // overlap

	//      char *strcpy(char *dest, const char *src);

	x[39] = '\0';
	strcpy(x, x+20);

	// The  strcpy()  function  copies  the string pointed to by src, including the terminating null byte ('\0'), to the buffer pointed to by dest.
	x[39] = 39;
	x[40] = '\0';
	strcpy(x, x+20); // overlap

	return 0;
}



// stephensun@debian:~/programming/linux/valgrind/memcheck$ valgrind ./badlap
// ==6663== Memcheck, a memory error detector
// ==6663== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==6663== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==6663== Command: ./badlap
// ==6663==
// ==6663== Source and destination overlap in strncpy(0xfff000119, 0xfff000105, 21)
// ==6663==    at 0x4C2C866: __strncpy_sse2_unaligned (vg_replace_strmem.c:496)
// ==6663==    by 0x4005B9: main (badlap.c:20)
// ==6663==
// ==6663== Source and destination overlap in strncpy(0xfff000105, 0xfff000119, 21)
// ==6663==    at 0x4C2C866: __strncpy_sse2_unaligned (vg_replace_strmem.c:496)
// ==6663==    by 0x4005F1: main (badlap.c:22)
// ==6663==
// ==6663== Source and destination overlap in strcpy(0xfff0000f0, 0xfff000104)
// ==6663==    at 0x4C2C326: strcpy (vg_replace_strmem.c:458)
// ==6663==    by 0x40062B: main (badlap.c:32)
// ==6663==
// ==6663==
// ==6663== HEAP SUMMARY:
// ==6663==     in use at exit: 0 bytes in 0 blocks
// ==6663==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
// ==6663==
// ==6663== All heap blocks were freed -- no leaks are possible
// ==6663==
// ==6663== For counts of detected and suppressed errors, rerun with: -v
// ==6663== ERROR SUMMARY: 3 errors from 3 contexts (suppressed: 0 from 0)

