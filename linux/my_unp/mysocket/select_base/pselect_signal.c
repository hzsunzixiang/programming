#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <string.h>


#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while(0)


//  Manual page select_tut(2)
static volatile sig_atomic_t got_SIG = 0;

// typedef int __sig_atomic_t;
//typedef __sig_atomic_t sig_atomic_t;

	static void
sig_handler(int sig)
{
	got_SIG = 1;
	fprintf(stderr, "in sig_handler. got_SIG = %d\n", got_SIG);
}

	int
main(int argc, char *argv[])
{
	sigset_t sigmask, empty_mask;
	struct sigaction sa;
	fd_set readfds, writefds, exceptfds;
	int r, nfds = 0;
	struct timespec ts;

	sigemptyset(&sigmask);
	sigaddset(&sigmask, SIGINT);
	if (sigprocmask(SIG_BLOCK, &sigmask, NULL) == -1) {
		perror("sigprocmask");
		exit(EXIT_FAILURE);
	}

	sa.sa_flags = 0;
	sa.sa_handler = sig_handler;
	sigemptyset(&sa.sa_mask);
	if (sigaction(SIGINT, &sa, NULL) == -1) {
		perror("sigaction");
		exit(EXIT_FAILURE);
	}

	sigemptyset(&empty_mask);

	/* Watch stdin (fd 0) to see when it has input*/
	FD_ZERO(&readfds);
	FD_SET(0, &readfds);
	/* Wait up to five seconds*/
	ts.tv_sec = 5;
	ts.tv_nsec = 0;
	for (;;) {	       /* main loop */
		/* Initialize readfds, writefds, and exceptfds
		   before the pselect() call. (Code omitted.) */
		/* Watch stdin (fd 0) to see when it has input*/
		FD_ZERO(&readfds);
		FD_SET(0, &readfds);
		/* Wait up to five seconds*/
		ts.tv_sec = 5;
		ts.tv_nsec = 0;

		// 调用select是信号掩码置为empty_mask, 返回时恢复
		// 如果同时有信号和输入到来，先处理输入，再返回-1 处理信号
		// 是有优先级的？
		//
		//sleeping start ...
		//^C^C^C^C^C^C^C^C^C^C8899999
		//sleeping over ...
		//pselect return. r = 1
		//Data is available now. r = 1
		//FD_ISSET(0, &readfds)
		//the input is 8899999
		//
		//sleeping start ...
		//9999999999999999999
		//sleeping over ...
		//pselect return. r = 1
		//Data is available now. r = 1
		//FD_ISSET(0, &readfds)
		//the input is 9999999999999999999
		//
		//sleeping start ...
		//sleeping over ...
		//in sig_handler. got_SIG = 1
		//pselect return. r = -1
		//r =:-1
		//got_sig :1
		//
		r = pselect(nfds + 1, &readfds, &writefds, &exceptfds,
				NULL, &empty_mask);
		fprintf(stderr, "pselect return. r = %d\n", r);
		if (r == -1 && errno != EINTR) {
			/* Handle error */
			err_sys("select:");
		}
		else if (r == -1) {
			fprintf(stderr, "r =:%d\n", r);
		}
		if (got_SIG) {
			fprintf(stderr, "got_sig :%d\n", got_SIG);
			got_SIG = 0;
			/* Handle signalled event here; e.g., wait() for all
			   terminated children. (Code omitted.) */
			continue;
		}

		/* main body of program */
		if (r > 0)
		{
			fprintf(stderr, "Data is available now. r = %d\n", r);
			if (FD_ISSET(0, &readfds))
			{
				char buf[100];
				memset(&buf, 0, sizeof(buf));
				fprintf(stderr, "FD_ISSET(0, &readfds)\n");
				ssize_t ret = read(0, buf, 99);
				if(ret < 0)
				{
					err_sys("select");
				}
				else if(ret)
				{
					fprintf(stderr, "the input is %s\n", buf);
				}
				else
					fprintf(stderr, "end of file.\n");
			}
			
			fprintf(stderr, "sleeping start ...\n");
			sleep(10);
			fprintf(stderr, "sleeping over ...\n");

			/*FD_ISSET(0, &readfds) will be true*/
		}
		else
			fprintf(stderr, "No data within five seconds.\n");
	}
}
