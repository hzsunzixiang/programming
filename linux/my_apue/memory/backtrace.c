//EXAMPLE
//       The program below demonstrates the use of backtrace() and backtrace_symbols().  The following shell session shows what we might see when running the program:
//
//           $ cc -rdynamic prog.c -o prog
//           $ ./prog 3
//           backtrace() returned 8 addresses
//           ./prog(myfunc3+0x5c) [0x80487f0]
//           ./prog [0x8048871]
//           ./prog(myfunc+0x21) [0x8048894]
//           ./prog(myfunc+0x1a) [0x804888d]
//           ./prog(myfunc+0x1a) [0x804888d]
//           ./prog(main+0x65) [0x80488fb]
//           /lib/libc.so.6(__libc_start_main+0xdc) [0xb7e38f9c]
//           ./prog [0x8048711]
//
//   Program source
//
#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

	void
myfunc3(void)
{
	int j, nptrs;
#define SIZE 100
	void *buffer[100];
	char **strings;

	nptrs = backtrace(buffer, SIZE);
	printf("backtrace() returned %d addresses\n", nptrs);

	/* The call backtrace_symbols_fd(buffer, nptrs, STDOUT_FILENO)
	   would produce similar output to the following: */

	strings = backtrace_symbols(buffer, nptrs);
	if (strings == NULL) {
		perror("backtrace_symbols");
		exit(EXIT_FAILURE);
	}

	for (j = 0; j < nptrs; j++)
		printf("%s\n", strings[j]);

	 //The address of the array of string pointers is returned as the function result of  backtrace_symbols().  This array is malloc(3)ed by backtrace_symbols(), and must be freed by the caller.  (The strings pointed to by the array of pointers need not and should not be freed.)

	free(strings);
}

	static void   /* "static" means don't export the symbol... */
myfunc2(void)
{
	myfunc3();
}

	void
myfunc(int ncalls)
{
	if (ncalls > 1)
		myfunc(ncalls - 1);
	else
		myfunc2();
}

	int
main(int argc, char *argv[])
{
	if (argc != 2) {
		fprintf(stderr, "%s num-calls\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	myfunc(atoi(argv[1]));
	exit(EXIT_SUCCESS);
}
