#define _GNU_SOURCE



static int globval;

static void f1(int i, int j, int k, int l)
{
	globval = 95; i= 96; j= 97; k= 98; l = 99;

}
int foo()
{

	int autoval;
	register int regival;
	volatile int volaval;
	static  int statval;

	globval = 1; autoval = 2; regival = 3; volaval = 4; statval = 5;

	f1(autoval, regival, volaval, statval); // never returns 

	return 0;
}

