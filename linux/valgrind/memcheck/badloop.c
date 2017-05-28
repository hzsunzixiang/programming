
#include <stdlib.h>
#include <stdio.h>



int main()
{
	int a[5];
	int i, s;
	a[0] = a[1] = a[2] = a[3] = 0;
	// a[4]= 0;
	s = 0;
	for (i = 0; i < 5; i++)
	{
		s += a[i];
	}

	printf ("sum is :%d\n", s);
	return 0;
}




// stephensun@debian:~/programming/linux/valgrind/memcheck$ valgrind ./badloop
// ==3926== Memcheck, a memory error detector
// ==3926== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==3926== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==3926== Command: ./badloop
// ==3926==
// ==3926== Conditional jump or move depends on uninitialised value(s)
// ==3926==    at 0x4E7E6FA: vfprintf (vfprintf.c:1641)
// ==3926==    by 0x4E85E68: printf (printf.c:33)
// ==3926==    by 0x400560: main (badloop.c:18)
// ==3926==
// ==3926== Use of uninitialised value of size 8
// ==3926==    at 0x4E7B17B: _itoa_word (_itoa.c:179)
// ==3926==    by 0x4E7F329: vfprintf (vfprintf.c:1641)
// ==3926==    by 0x4E85E68: printf (printf.c:33)
// ==3926==    by 0x400560: main (badloop.c:18)
// ==3926==
// ==3926== Conditional jump or move depends on uninitialised value(s)
// ==3926==    at 0x4E7B185: _itoa_word (_itoa.c:179)
// ==3926==    by 0x4E7F329: vfprintf (vfprintf.c:1641)
// ==3926==    by 0x4E85E68: printf (printf.c:33)
// ==3926==    by 0x400560: main (badloop.c:18)
// ==3926==
// ==3926== Conditional jump or move depends on uninitialised value(s)
// ==3926==    at 0x4E7F37C: vfprintf (vfprintf.c:1641)
// ==3926==    by 0x4E85E68: printf (printf.c:33)
// ==3926==    by 0x400560: main (badloop.c:18)
// ==3926==
// ==3926== Conditional jump or move depends on uninitialised value(s)
// ==3926==    at 0x4E7E7CC: vfprintf (vfprintf.c:1641)
// ==3926==    by 0x4E85E68: printf (printf.c:33)
// ==3926==    by 0x400560: main (badloop.c:18)
// ==3926==
// ==3926== Conditional jump or move depends on uninitialised value(s)
// ==3926==    at 0x4E7E84C: vfprintf (vfprintf.c:1641)
// ==3926==    by 0x4E85E68: printf (printf.c:33)
// ==3926==    by 0x400560: main (badloop.c:18)
// ==3926==
// sum is :-16776688
// ==3926==
// ==3926== HEAP SUMMARY:
// ==3926==     in use at exit: 0 bytes in 0 blocks
// ==3926==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
// ==3926==
// ==3926== All heap blocks were freed -- no leaks are possible
// ==3926==
// ==3926== For counts of detected and suppressed errors, rerun with: -v
// ==3926== Use --track-origins=yes to see where uninitialised values come from
// ==3926== ERROR SUMMARY: 20 errors from 6 contexts (suppressed: 0 from 0)

