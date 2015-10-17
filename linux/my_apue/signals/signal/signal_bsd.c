#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
#define err_dump(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)



/*one handler for both signals*/
static void sig_int(int);
extern __sighandler_t bsd_signal (int __sig, __sighandler_t __handler);
extern __sighandler_t sysv_signal (int __sig, __sighandler_t __handler);

//       The difference between the two is that bsd_signal()  is	guaranteed  to
//       provide	reliable  signal semantics, that is: a) the disposition of the
//       signal is not reset to the default when	the  handler  is  invoked;  b)
//       delivery of further instances of the signal is blocked while the signal
//       handler is executing; and c) if the handler interrupts a blocking  sys-
//       tem  call, then the system call is automatically restarted.  A portable
//       application cannot rely on signal(2) to provide these guarantees.
//
//       bsd_signal - signal handling with BSD semantics
//       On modern Linux systems, bsd_signal()  and  signal(2)  are  equivalent.
//       But  on	older systems, signal(2) provided unreliable signal semantics;
//       see signal(2) for details.
//       bsd_signal 和 signal 语义一样，在现代操作系统上 
int main(void)
{
	    // 	rt_sigaction(SIGUSR1, {0x8048515, [USR1], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
	__sighandler_t handler = bsd_signal(SIGINT, sig_int);
	if (handler == SIG_ERR)
	{
		err_sys("can't catch SIGINT");
	}
	else 
	{
		fprintf(stderr, "old handler= %p\n", handler);
	}
	//if (sysv_signal(SIGINT, sig_int) == SIG_ERR)
		// rt_sigaction(SIGINT, {0x8048535, [], SA_INTERRUPT|SA_NODEFER|SA_RESETHAND}, {SIG_DFL, [], 0}, 8) = 0
	//if (signal(SIGUSR1, sig_usr) == SIG_ERR)
	    // 	rt_sigaction(SIGUSR1, {0x8048515, [USR1], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
	for (; ;)
		pause();
	return 0;
}

static void sig_int(int signo)
{
	//  __sighandler_t handler = bsd_signal(SIGINT, sig_int);
	//  if (handler == SIG_ERR)
	//  {
	//  	err_sys("can't catch SIGUSR1");
	//  }
	//  else 
	//  {
	//  	fprintf(stderr, "in signal handler, old handler= %d\n", (int)handler);
	//  }
	if (signo == SIGINT)
		printf("recived SIGUSR1\n");
	else
		fprintf(stderr, "received signal:%d\n", signo);
       //. If the signal occurs as the result of calling the abort(),
       //raise(),	  kill(), pthread_kill(), or sigqueue()	 function, the	signal
       //handler shall not call the raise() function.
	   // 再次引发会引起无限循环
	// raise(SIGINT);
}




