#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
#define err_dump(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)


// /usr/include/bits/signum.h
// /* Fake signal functions.  */
// #define SIG_ERR	((__sighandler_t) -1)		/* Error return.  */
// #define SIG_DFL	((__sighandler_t) 0)		/* Default action.  */
// #define SIG_IGN	((__sighandler_t) 1)		/* Ignore signal.  */

/*one handler for both signals*/
static void sig_usr(int);

int main(void)
{
	if (signal(SIGUSR1, sig_usr) == SIG_ERR)
	{
		err_sys("can't catch SIGUSR1");
	}
	if (signal(SIGUSR2, sig_usr) == SIG_ERR)
	{
		err_sys("can't catch SIGUSR2");
	}
	for (; ;)
		pause();
}

static void sig_usr(int signo)
{
	if (signo == SIGUSR1)
		printf("recived SIGUSR1\n");
	else if (signo == SIGUSR2)
		printf("recived SIGUSR2\n");
	else
		fprintf(stderr, "received signal:%d\n", signo);
}
