#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <setjmp.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)



static void f1(int, int, int, int);
static void f2(void);

static jmp_buf jmpbuffer;
static int globval;

int main()
{

	int autoval;
	register int regival;
	volatile int volaval;
	static  int statval;

	globval = 1; autoval = 2; regival = 3; volaval = 4; statval = 5;
	int ret = 0;
	if ( (ret = setjmp(jmpbuffer)) != 0)
	{
		fprintf(stderr, "after longjmp: ret:%d\n", ret);
		fprintf(stderr, "globval = %d; autoval = %d; regival = %d; volaval = %d; statval = %d;\n", 
				globval, autoval, regival, volaval, statval);
		exit(0);
	}

	// change variables after setjmp, but before longjmp
	globval = 95; autoval = 96; regival = 97; volaval = 98; statval = 99;

	f1(autoval, regival, volaval, statval); // never returns 
	exit(0);

	return 0;
}


static void f1(int i, int j, int k, int l)
{
	fprintf(stderr,"int f1():\n");
	fprintf(stderr, "globval = %d; autoval = %d; regival = %d; volaval = %d; statval = %d;\n", 
			globval, i, j, k, l);
	f2();

}
static void f2(void)
{
	longjmp(jmpbuffer,0);
}

