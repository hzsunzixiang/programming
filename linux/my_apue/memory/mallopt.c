//EXAMPLE
//       The  program  below  demonstrates  the  use  of  M_CHECK_ACTION.   If  the  program  is  supplied  with  an (integer) command-line argument, then that argument is used to set the
//       M_CHECK_ACTION parameter.  The program then allocates a block of memory, and frees it twice (an error).
//
//       The following shell session shows what happens when we run this program under glibc, with the default value for M_CHECK_ACTION:
//
//           $ ./a.out
//           main(): returned from first free() call
//           *** glibc detected *** ./a.out: double free or corruption (top): 0x09d30008 ***
//           ======= Backtrace: =========
//           /lib/libc.so.6(+0x6c501)[0x523501]
//           /lib/libc.so.6(+0x6dd70)[0x524d70]
//           /lib/libc.so.6(cfree+0x6d)[0x527e5d]
//           ./a.out[0x80485db]
//           /lib/libc.so.6(__libc_start_main+0xe7)[0x4cdce7]
//           ./a.out[0x8048471]
//           ======= Memory map: ========
//           001e4000-001fe000 r-xp 00000000 08:06 1083555    /lib/libgcc_s.so.1
//           001fe000-001ff000 r--p 00019000 08:06 1083555    /lib/libgcc_s.so.1
//           [some lines omitted]
//           b7814000-b7817000 rw-p 00000000 00:00 0
//           bff53000-bff74000 rw-p 00000000 00:00 0          [stack]
//           Aborted (core dumped)
//
//       The following runs show the results when employing other values for M_CHECK_ACTION:
//
//           $ ./a.out 1             # Diagnose error and continue
//           main(): returned from first free() call
//           *** glibc detected *** ./a.out: double free or corruption (top): 0x09cbe008 ***
//           main(): returned from second free() call
//           $ ./a.out 2             # Abort without error message
//           main(): returned from first free() call
//           Aborted (core dumped)
//           $ ./a.out 0             # Ignore error and continue
//           main(): returned from first free() call
//           main(): returned from second free() call
//
//       The next run shows how to set the same parameter using the MALLOC_CHECK_ environment variable:
//
//           $ MALLOC_CHECK_=1 ./a.out
//           main(): returned from first free() call
//           *** glibc detected *** ./a.out: free(): invalid pointer: 0x092c2008 ***
//           main(): returned from second free() call
//
//   Program source

#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

	int
main(int argc, char *argv[])
{
	char *p;

	if (argc > 1) {
		if (mallopt(M_CHECK_ACTION, atoi(argv[1])) != 1) {
			fprintf(stderr, "mallopt() failed");
			exit(EXIT_FAILURE);
		}
	}

	p = malloc(1000);
	if (p == NULL) {
		fprintf(stderr, "malloc() failed");
		exit(EXIT_FAILURE);
	}

	free(p);
	printf("main(): returned from first free() call\n");

	free(p);
	printf("main(): returned from second free() call\n");

	exit(EXIT_SUCCESS);
}
