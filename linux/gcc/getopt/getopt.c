#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// http://www.gnu.org/software/libc/manual/html_node/Example-of-Getopt.html
// root@debian32-1:~/programming/linux/gcc/getopt# ./getopt -b -a -c 10
// ---- optind= 2, optarg= (null), optopt=0 ----
// ---- optind= 3, optarg= (null), optopt=0 ----
// ---- optind= 5, optarg= 10, optopt=0 ----
// aflag = 1, bflag = 1, cvalue = 10

///usr/include/getopt.h
int main (int argc, char **argv)
{
	int aflag = 0;
	int bflag = 0;
	char *cvalue = NULL;
	int index;
	int c;

	opterr = 0; // 这是全局变量  extern int opterr;

	//int getopt(int argc, char * const argv[], const char *optstring);

	printf("start ---- optind= %d, argv[optind    ]=%s, optarg= %s, optopt=%c ----\n", optind, argv[optind], optarg, optopt);
	while ((c = getopt (argc, argv, "abc:")) != -1)
	{
		// extern int optind;
		// 处理之后，optind 会 自增1
		printf("      ---- optind= %d, argv[optind - 1]=%s, optarg= %s, optopt=%c, c=%c ----\n", optind, argv[optind - 1], optarg, optopt, c);
		switch (c)
		{
			case 'a':
				aflag = 1;
				break;
			case 'b':
				bflag = 1;
				break;
			case 'c':
				cvalue = optarg;
				///* For communication from `getopt' to the caller.
				//   When `getopt' finds an option that takes an argument,
				//   the argument value is returned here.
				//   Also, when `ordering' is RETURN_IN_ORDER,
				//   each non-option ARGV-element is returned here.  */
				//
				//extern char *optarg;
				break;
			case '?':
				///* Set to an option character which was unrecognized.  */
				//
				//extern int optopt;
				if (optopt == 'c')
					fprintf (stderr, "Option -%c requires an argument.\n", optopt);
				else if (isprint (optopt))
					fprintf (stderr, "Unknown option `-%c'.\n", optopt);
				else
					fprintf (stderr, "Unknown option character `\\x%x'.\n", optopt);
				return 1;
			default:
				abort ();
		}

	}
	printf ("aflag = %d, bflag = %d, cvalue = %s\n", aflag, bflag, cvalue);

	for (index = optind; index < argc; index++)
		printf ("index =%d, Non-option argument %s\n", index, argv[index]);
	return 0;
}

