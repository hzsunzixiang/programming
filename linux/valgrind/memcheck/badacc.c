
#include <stdlib.h>
#include <stdio.h>



int main()
{
	int len = 4;
	int *pt = (int *)malloc(len*sizeof(int));
	int *p = pt;

	for (int i = 0; i < len; i++)
	{
		p++;
	}

	*p = 5;

	printf("the value of *p is :%d\n", *p);

	return 0;
}


// stephensun@debian:~/programming/linux/valgrind/memcheck$ valgrind ./badacc
// ==4037== Memcheck, a memory error detector
// ==4037== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==4037== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==4037== Command: ./badacc
// ==4037==
// ==4037== Invalid write of size 4
// ==4037==    at 0x400590: main (badacc.c:18)
// ==4037==  Address 0x51e0050 is 0 bytes after a block of size 16 alloc'd
// ==4037==    at 0x4C28C20: malloc (vg_replace_malloc.c:296)
// ==4037==    by 0x400565: main (badacc.c:10)
// ==4037==
// ==4037== Invalid read of size 4
// ==4037==    at 0x40059A: main (badacc.c:20)
// ==4037==  Address 0x51e0050 is 0 bytes after a block of size 16 alloc'd
// ==4037==    at 0x4C28C20: malloc (vg_replace_malloc.c:296)
// ==4037==    by 0x400565: main (badacc.c:10)
// ==4037==
// the value of *p is :5
// ==4037==
// ==4037== HEAP SUMMARY:
// ==4037==     in use at exit: 16 bytes in 1 blocks
// ==4037==   total heap usage: 1 allocs, 0 frees, 16 bytes allocated
// ==4037==
// ==4037== LEAK SUMMARY:
// ==4037==    definitely lost: 16 bytes in 1 blocks
// ==4037==    indirectly lost: 0 bytes in 0 blocks
// ==4037==      possibly lost: 0 bytes in 0 blocks
// ==4037==    still reachable: 0 bytes in 0 blocks
// ==4037==         suppressed: 0 bytes in 0 blocks
// ==4037== Rerun with --leak-check=full to see details of leaked memory
// ==4037==
// ==4037== For counts of detected and suppressed errors, rerun with: -v
// ==4037== ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 from 0)

