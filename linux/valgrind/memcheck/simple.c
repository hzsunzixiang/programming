
#include <stdlib.h>


void fun()
{
	int *p = (int*)malloc(10*sizeof(int));
	p[10] = 0;
	//free(p);
}

int main()
{
	fun();

	return 0;
}


// stephensun@debian:~/programming/linux/valgrind/memcheck$ valgrind ./simple
// ==2080== Memcheck, a memory error detector
// ==2080== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==2080== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==2080== Command: ./simple
// ==2080==
// ==2080== Invalid write of size 4
// ==2080==    at 0x400524: fun (simple.c:8)
// ==2080==    by 0x400539: main (simple.c:13)
// ==2080==  Address 0x51e0068 is 0 bytes after a block of size 40 alloc'd
// ==2080==    at 0x4C28C20: malloc (vg_replace_malloc.c:296)
// ==2080==    by 0x400517: fun (simple.c:7)
// ==2080==    by 0x400539: main (simple.c:13)
// ==2080==
// ==2080==
// ==2080== HEAP SUMMARY:
// ==2080==     in use at exit: 40 bytes in 1 blocks
// ==2080==   total heap usage: 1 allocs, 0 frees, 40 bytes allocated
// ==2080==
// ==2080== LEAK SUMMARY:
// ==2080==    definitely lost: 40 bytes in 1 blocks
// ==2080==    indirectly lost: 0 bytes in 0 blocks
// ==2080==      possibly lost: 0 bytes in 0 blocks
// ==2080==    still reachable: 0 bytes in 0 blocks
// ==2080==         suppressed: 0 bytes in 0 blocks
// ==2080== Rerun with --leak-check=full to see details of leaked memory
// ==2080==
// ==2080== For counts of detected and suppressed errors, rerun with: -v
// ==2080== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)



// 释放内存之后
// stephensun@debian:~/programming/linux/valgrind/memcheck$ valgrind ./simple
// ==2156== Memcheck, a memory error detector
// ==2156== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==2156== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==2156== Command: ./simple
// ==2156==
// ==2156== Invalid write of size 4
// ==2156==    at 0x400564: fun (simple.c:8)
// ==2156==    by 0x400585: main (simple.c:14)
// ==2156==  Address 0x51e0068 is 0 bytes after a block of size 40 alloc'd
// ==2156==    at 0x4C28C20: malloc (vg_replace_malloc.c:296)
// ==2156==    by 0x400557: fun (simple.c:7)
// ==2156==    by 0x400585: main (simple.c:14)
// ==2156==
// ==2156==
// ==2156== HEAP SUMMARY:
// ==2156==     in use at exit: 0 bytes in 0 blocks
// ==2156==   total heap usage: 1 allocs, 1 frees, 40 bytes allocated
// ==2156==
// ==2156== All heap blocks were freed -- no leaks are possible
// ==2156==
// ==2156== For counts of detected and suppressed errors, rerun with: -v
// ==2156== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)

// 不再写越界
// stephensun@debian:~/programming/linux/valgrind/memcheck$ valgrind ./simple
// ==2174== Memcheck, a memory error detector
// ==2174== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==2174== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==2174== Command: ./simple
// ==2174==
// ==2174==
// ==2174== HEAP SUMMARY:
// ==2174==     in use at exit: 0 bytes in 0 blocks
// ==2174==   total heap usage: 1 allocs, 1 frees, 40 bytes allocated
// ==2174==
// ==2174== All heap blocks were freed -- no leaks are possible
// ==2174==
// ==2174== For counts of detected and suppressed errors, rerun with: -v
// ==2174== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)

