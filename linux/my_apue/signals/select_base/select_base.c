#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>


#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while(0)

void sig_handler(int signum)
{
	printf("in handler\n");
	sleep(1);
	printf("handler return\n");
}


//       The following interfaces are never restarted after being interrupted by
//       a signal handler, regardless of the use of SA_RESTART; they always fail
//       with the error EINTR when interrupted by a signal handler:
//
//       * Socket  interfaces,  when  a  timeout  has been set on the socket
//         using  setsockopt(2):  accept(2),   recv(2),   recvfrom(2),   and
//         recvmsg(2), if a receive timeout (SO_RCVTIMEO) has been set; con-
//         nect(2), send(2), sendto(2), and sendmsg(2), if  a  send  timeout
//         (SO_SNDTIMEO) has been set.
//
//       * Interfaces  used  to  wait  for signals: pause(2), sigsuspend(2),
//         sigtimedwait(2), and sigwaitinfo(2).
//        ---- select poll epoll
//       * File   descriptor   multiplexing    interfaces:    epoll_wait(2),
//         epoll_pwait(2), poll(2), ppoll(2), select(2), and pselect(2).
//
//       * System V IPC interfaces: msgrcv(2), msgsnd(2), semop(2), and sem-
//         timedop(2).
//

int main(void)
{
	fd_set rfds;
	struct timeval tv;
	int retval;
	typedef void (*__sighandler_t) (int);
	__sighandler_t handler = signal(SIGINT, sig_handler);
	if (handler == SIG_ERR)
	{
		err_sys("can't catch SIGUSR1");
	}

	/* Watch stdin (fd 0) to see when it has input*/
	FD_ZERO(&rfds);
	FD_SET(0, &rfds);

	/* Wait up to five seconds*/
	tv.tv_sec = 5;
	tv.tv_usec = 0;
	retval = select(1, &rfds, NULL, NULL, &tv);
	/*Don't rely one the value of tv now!*/
	if (retval == -1)
	{
		err_sys("select");
	}
	else if (retval)
	{
		fprintf(stderr, "Data is available now.\n");
		if (FD_ISSET(0, &rfds))
		{
			char buf[100];
			fprintf(stderr, "FD_ISSET(0, &rfds)\n");
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

		/*FD_ISSET(0, &rfds) will be true*/
	}
	else
		fprintf(stderr, "No data within five seconds.\n");

	exit(EXIT_SUCCESS);
}
