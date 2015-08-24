#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>


#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while(0)

// 这个例子还没有成型

//  Manual page select_tut(2)
static volatile sig_atomic_t got_SIG = 0;

	static void
sig_handler(int sig)
{
	got_SIG = 1;
}

	int
main(int argc, char *argv[])
{
	sigset_t sigmask, empty_mask;
	struct sigaction sa;
	fd_set readfds, writefds, exceptfds;
	int r, nfds = 0;

	sigemptyset(&sigmask);
	sigaddset(&sigmask, SIGINT);
	if (sigprocmask(SIG_BLOCK, &sigmask, NULL) == -1) {
		perror("sigprocmask");
		exit(EXIT_FAILURE);
	}

	sa.sa_flags = 0;
	sa.sa_handler = sig_handler;
	sigemptyset(&sa.sa_mask);
	//if (sigaction(SIGINT, &empty_mask, NULL) == -1) {
	//	perror("sigaction");
	//	exit(EXIT_FAILURE);
	//}

	sigemptyset(&empty_mask);

	for (;;) {	       /* main loop */
		/* Initialize readfds, writefds, and exceptfds
		   before the pselect() call. (Code omitted.) */

		// 调用select是信号掩码置为empty_mask, 返回时恢复
		r = pselect(nfds, &readfds, &writefds, &exceptfds,
				NULL, &sigmask);
		if (r == -1 && errno != EINTR) {
			/* Handle error */
			err_sys("select:");
		}
		else if (r == -1 ) {
			fprintf(stderr, "r =:%d\n", r);
		}
		if (got_SIG) {
			fprintf(stderr, "got_sig :%d\n", got_SIG);
			got_SIG = 0;
			/* Handle signalled event here; e.g., wait() for all
			   terminated children. (Code omitted.) */
		}

		/* main body of program */
	}
}
