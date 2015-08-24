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
static void sig_int(int);
extern __sighandler_t bsd_signal (int __sig, __sighandler_t __handler);
extern __sighandler_t sysv_signal (int __sig, __sighandler_t __handler);

//       However sysv_signal() provides the System V  unreliable	signal	seman-
//       tics, that is: 
//       a) the disposition of the signal is reset to the default  when the handler is invoked;
//       b) delivery of further  instances  of  the  signal  is not blocked while the signal handler is executing; and
//       c) if the handler interrupts (certain) blocking system calls, then the system call is not automatically restarted.
//
//       On older Linux systems, sysv_signal() and  signal(2)  were  equivalent.
//       But on newer systems, signal(2) provides reliable signal semantics; see
//       signal(2) for details.
//       sysv_signal 用的是旧的语义
int main(void)
{
	//if (bsd_signal(SIGUSR1, sig_usr) == SIG_ERR)
	    // 	rt_sigaction(SIGUSR1, {0x8048515, [USR1], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
	__sighandler_t handler = sysv_signal(SIGINT, sig_int);
	if (handler == SIG_ERR)
	{
		err_sys("can't catch SIGINT");
	}
	else 
	{
		fprintf(stderr, "handler= %d\n", (int)handler);
	}
		// rt_sigaction(SIGINT, {0x8048535, [], SA_INTERRUPT|SA_NODEFER|SA_RESETHAND}, {SIG_DFL, [], 0}, 8) = 0
	//if (signal(SIGINT, sig_usr) == SIG_ERR)
	    // 	rt_sigaction(SIGUSR1, {0x8048515, [USR1], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
	for (; ;)
	{
		pause();
	}
}

static void sig_int(int signo)
{
	// 如果不重新安装，就会恢复到默认值SIG_DFL
	// b) delivery of further  instances  of  the  signal  is not blocked while the signal handler is executing; and
	// 不自动重启被中断的信号 ~/programming/linux/my_apue/signals/interrupt_system/read_intr_signal.c
	__sighandler_t handler = sysv_signal(SIGINT, sig_int);
	if (handler == SIG_ERR)
	{
		err_sys("can't catch SIGUSR1");
	}
	else 
	{
		fprintf(stderr, "in signal handler,handler= %d\n", (int)handler);
	}
	if (signo == SIGINT)
		printf("recived SIGUSR1\n");
	else
		fprintf(stderr, "received signal:%d\n", signo);
}
