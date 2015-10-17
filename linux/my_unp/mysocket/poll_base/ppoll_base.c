#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>
#include<errno.h>
#include<signal.h>
#include<poll.h>
#include<sys/poll.h>

#include<limits.h> // for OPEN_MAX

#define __USE_GNU 2015
// warning: implicit declaration of function ‘ppoll’
//
extern int ppoll (struct pollfd *__fds, nfds_t __nfds,
		  __const struct timespec *__timeout,
		  __const __sigset_t *__ss);
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

int main(void)
{
	struct pollfd client;
	int retval;
	sigset_t sigmask, empty_mask;
	struct sigaction sa;

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
	client.fd = 0;
	client.events = POLLIN;
	struct timespec timeout;
	timeout.tv_sec = 5;
	timeout.tv_nsec = 0;

	for(; ;)
	{
		// 跟pselect行为一样 ,也是先处理可读写时间，再处理信号
        retval = ppoll(&client, 1, NULL, &empty_mask);
		fprintf(stderr, "ppoll return. retval = %d\n", retval);
		if (retval == -1) {
			fprintf(stderr, "retval =:%d\n", retval);
			if (errno != EINTR) {
				/* Handle error */
				err_sys("select:");
			}
		}
		if (got_SIG) {
			fprintf(stderr, "got_sig :%d\n", got_SIG);
			got_SIG = 0;
			/* Handle signalled event here; e.g., wait() for all
			   terminated children. (Code omitted.) */
			continue;
		}

		if (retval > 0)
		{
			fprintf(stderr, "Data is available now.\n");
			if (client.revents & POLLIN)  
			{
				char buf[100];
				memset(&buf, 0, sizeof(buf));
				fprintf(stderr, "client.revents & POLLIN\n");
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

			/*client.revents & POLLIN will be true*/
		}
		else
			fprintf(stderr, "No data within five seconds.\n");
	}

	exit(EXIT_SUCCESS);
}
