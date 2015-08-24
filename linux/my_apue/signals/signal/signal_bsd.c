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
extern __sighandler_t bsd_signal (int __sig, __sighandler_t __handler);
extern __sighandler_t sysv_signal (int __sig, __sighandler_t __handler);

int main(void)
{
	//if (bsd_signal(SIGUSR1, sig_usr) == SIG_ERR)
	    // 	rt_sigaction(SIGUSR1, {0x8048515, [USR1], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
	if (sysv_signal(SIGUSR1, sig_usr) == SIG_ERR)
		// rt_sigaction(SIGUSR1, {0x8048535, [], SA_INTERRUPT|SA_NODEFER|SA_RESETHAND}, {SIG_DFL, [], 0}, 8) = 0
	//if (signal(SIGUSR1, sig_usr) == SIG_ERR)
	    // 	rt_sigaction(SIGUSR1, {0x8048515, [USR1], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
	{
		err_sys("can't catch SIGUSR1");
	}
	for (; ;)
		pause();
}

static void sig_usr(int signo)
{
	if (signo == SIGUSR1)
		printf("recived SIGUSR1\n");
	else
		fprintf(stderr, "received signal:%d\n", signo);
}
