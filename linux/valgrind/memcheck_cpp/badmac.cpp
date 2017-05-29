#include <stdlib.h>
#include <unistd.h>
#include <map>



int main()
{
	int i;
	char *p = (char *)malloc(10);
	char *pt = p;
	for (i = 0; i < 10; i++)
	{
		p[i] = 'z'; 
	}
	delete p;
	pt[1] = 'x';

	free(pt);
	//pt[1] = 'x';
	return 0;
}



// stephensun@debian:~/programming/linux/valgrind/memcheck_cpp$ valgrind ./badmac
// ==6847== Memcheck, a memory error detector
// ==6847== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==6847== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==6847== Command: ./badmac
// ==6847==
// ==6847== Mismatched free() / delete / delete []
// ==6847==    at 0x4C2A360: operator delete(void*) (vg_replace_malloc.c:507)
// ==6847==    by 0x4006D2: main (badmac.cpp:16)
// ==6847==  Address 0x5a02040 is 0 bytes inside a block of size 10 alloc'd
// ==6847==    at 0x4C28C20: malloc (vg_replace_malloc.c:296)
// ==6847==    by 0x400697: main (badmac.cpp:10)
// ==6847==
// ==6847== Invalid write of size 1
// ==6847==    at 0x4006DB: main (badmac.cpp:17)
// ==6847==  Address 0x5a02041 is 1 bytes inside a block of size 10 free'd
// ==6847==    at 0x4C2A360: operator delete(void*) (vg_replace_malloc.c:507)
// ==6847==    by 0x4006D2: main (badmac.cpp:16)
// ==6847==
// ==6847== Invalid free() / delete / delete[] / realloc()
// ==6847==    at 0x4C29E90: free (vg_replace_malloc.c:473)
// ==6847==    by 0x4006E9: main (badmac.cpp:19)
// ==6847==  Address 0x5a02040 is 0 bytes inside a block of size 10 free'd
// ==6847==    at 0x4C2A360: operator delete(void*) (vg_replace_malloc.c:507)
// ==6847==    by 0x4006D2: main (badmac.cpp:16)
// ==6847==
// ==6847==
// ==6847== HEAP SUMMARY:
// ==6847==     in use at exit: 0 bytes in 0 blocks
// ==6847==   total heap usage: 1 allocs, 2 frees, 10 bytes allocated
// ==6847==
// ==6847== All heap blocks were freed -- no leaks are possible
// ==6847==
// ==6847== For counts of detected and suppressed errors, rerun with: -v
// ==6847== ERROR SUMMARY: 3 errors from 3 contexts (suppressed: 0 from 0)

