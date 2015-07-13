#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <setjmp.h>
#include <errno.h>
#include <time.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

typedef void Sigfunc(int);

Sigfunc *
signal(int signo, Sigfunc *func);

void pr_mask(const char *str)
{
	sigset_t sigset;
	int      errno_save;
	errno_save = errno;  // we can be called by signal handlers
	if (sigprocmask(0, NULL, &sigset) < 0)
	{

		err_sys("sigprocmask err");
	}

	fprintf(stderr, "%s ", str);

	if (sigismember(&sigset, SIGINT))   printf("SIGINT ");
	if (sigismember(&sigset, SIGQUIT))  printf("SIGQUIT ");
	if (sigismember(&sigset, SIGUSR1))  printf("SIGUSR1 ");
	if (sigismember(&sigset, SIGALRM))  printf("SIGALRM ");

	// remaining signals can go here
	printf("\n");
	
	errno = errno_save;
	
}

static void  sig_usr1(int), sig_alrm(int);

static jmp_buf jmpbuf;
static volatile sig_atomic_t canjump;

// sigsetjmp 的第二个参数为1 
//   p_jdzxsun@centos7:~/programming/linux/my_apue/setjmp$ ./sigsetjmp &
//   [3] 2305
//   p_jdzxsun@centos7:~/programming/linux/my_apue/setjmp$ kill -10 2305
//   starting sig_usr1 SIGUSR1
//   p_jdzxsun@centos7:~/programming/linux/my_apue/setjmp$ in sig_alrm SIGUSR1 SIGALRM
//   finishing sig_usr1: SIGUSR1
//   ending main:

// sigsetjmp 的第二个参数为0 
//p_jdzxsun@centos7:~/programming/linux/my_apue/setjmp$ ./sigsetjmp &
//[3] 17629
//p_jdzxsun@centos7:~/programming/linux/my_apue/setjmp$ kill -10 17629
//starting sig_usr1 SIGUSR1
//p_jdzxsun@centos7:~/programming/linux/my_apue/setjmp$ in sig_alrm SIGUSR1 SIGALRM
//finishing sig_usr1: SIGUSR1
//ending main: SIGUSR1
//
//[3]-  Done                    ./sigsetjmp



int main()
{
	if (signal(SIGUSR1, sig_usr1) == SIG_ERR)
	{
		err_sys("signal(SIGURSR1) error");
	}
	// 如果不安装信号，信号发生时，默认行为会终止进程
	if (signal(SIGALRM, sig_alrm) == SIG_ERR)
	{
		err_sys("signal(SIGALRM) error");
	}

	if (sigsetjmp(jmpbuf, 1))
	//if (sigsetjmp(jmpbuf, 0))
	{
		pr_mask("ending main:");
		exit(0);
	}

	canjump = 1;

	for (; ;)
		pause();

	return 0;
}


static void sig_usr1(int signo)
{
	time_t starttime;
	if (canjump == 0)  // 信号没准备好时直接返回
	{
		return;   // unexpected signal, ignore
	}
	pr_mask("starting sig_usr1");
	// 为信号alarm 安装了信号处理程序，不然默认行为终止进程
	alarm(3);   // SIGARM in 3 seconds
	starttime = time(NULL);
	for (; ;)
	{
		//printf("auto restart for loop");
		// 被中断之后自动重启
		if (time(NULL) > starttime + 20)
			break;
	}
	pr_mask("finishing sig_usr1:");
	// APUE中有解释，在一般的C代码中(不是信号处理程序)， 对于longjmp并不需要这种保护措施
	// 但是，因为信号可能在任何时候发生，所以在信号处理程序中，需要这种保护措施
	canjump = 0;  // 期间再有信号发生，直接返回 ,
	//  79 /* Jump to the environment saved in ENV, making the
	//  80 `setjmp' call there return VAL, or 1 if VAL is 0.  */
	
	siglongjmp(jmpbuf, 1);  // jump back to main do nt return
}

static void sig_alrm(int signo)
{
	pr_mask("in sig_alrm");
}
	Sigfunc *
signal(int signo, Sigfunc *func)
{
	struct sigaction act, oact;

	act.sa_handler = func;
	sigemptyset(&act.sa_mask);
	act.sa_flags = 0;
	if (signo == SIGALRM)
	{
#ifdef SA_INTERRUPT
		act.sa_flags |= SA_INTERRUPT;
#endif
	}
	else
	{
#ifdef SA_RESTART
		act.sa_flags |= SA_RESTART;
#endif
	}

	if (sigaction(signo, &act, &oact) < 0)
		return SIG_ERR;
	return oact.sa_handler;

}
