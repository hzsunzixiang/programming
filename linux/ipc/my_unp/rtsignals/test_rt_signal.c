#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <signal.h>
//    p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/rtsignals$ ./test_rt_signal
//    SIGRTMIN = 34, sigRTMAX = 64
//    sent signal 64, val = 0
//    sent signal 64, val = 1
//    sent signal 64, val = 2
//    sent signal 63, val = 0
//    sent signal 63, val = 1
//    sent signal 63, val = 2
//    sent signal 62, val = 0
//    sent signal 62, val = 1
//    sent signal 62, val = 2
//    p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/rtsignals$
//    received signal #62, si_signo #62, code = -1, ival = 0
//    
//    received signal #62, si_signo #62, code = -1, ival = 1
//    
//    received signal #62, si_signo #62, code = -1, ival = 2
//    
//    received signal #63, si_signo #63, code = -1, ival = 0
//    
//    received signal #63, si_signo #63, code = -1, ival = 1
//    
//    received signal #63, si_signo #63, code = -1, ival = 2
//    
//    received signal #64, si_signo #64, code = -1, ival = 0
//    
//    received signal #64, si_signo #64, code = -1, ival = 1
//    
//    received signal #64, si_signo #64, code = -1, ival = 2



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

static void sig_rt(int, siginfo_t *, void *);
typedef void Sigfunc_rt(int, siginfo_t *, void *);
	Sigfunc_rt *
signal_rt(int signo, Sigfunc_rt *func, sigset_t *mask);
int main(int argc, char *argv[])
{
	int i, j;
	pid_t pid;
	sigset_t newset;
	union sigval val;
	// man sigevent
	//
	//
	//    union sigval {          /* Data passed with notification */
	//    	int     sival_int;         /* Integer value */
	//    	void   *sival_ptr;         /* Pointer value */
	//    };

	//    struct sigevent {
	//    	int          sigev_notify; /* Notification method */
	//    	int          sigev_signo;  /* Notification signal */
	//    	union sigval sigev_value;  /* Data passed with
	//    								  notification */
	//    	void       (*sigev_notify_function) (union sigval);
	//    	/* Function used for thread
	//    	 *                                notification (SIGEV_THREAD) */
	//    	void        *sigev_notify_attributes;
	//    	/* Attributes for notification thread
	//    	 *                                (SIGEV_THREAD) */
	//    	pid_t        sigev_notify_thread_id;
	//    	/* ID of thread to signal (SIGEV_THREAD_ID) */
	//    };

	printf("SIGRTMIN = %d, sigRTMAX = %d\n", (int)SIGRTMIN, (int)SIGRTMAX);
	pid = fork();
	if (pid < 0)
	{
		handle_error("fork");
	}
	if (pid == 0)  // child block three realtime signals
	{
		sigemptyset(&newset);
		sigaddset(&newset, SIGRTMAX);
		sigaddset(&newset, SIGRTMAX - 1);
		sigaddset(&newset, SIGRTMAX - 2);
		sigprocmask(SIG_BLOCK, &newset, NULL);

		// establish signal handler with SA_SIGINFO set

		signal_rt(SIGRTMAX, sig_rt, &newset);
		signal_rt(SIGRTMAX - 1, sig_rt, &newset);
		signal_rt(SIGRTMAX - 2, sig_rt, &newset);

		sleep(6);  // let parent send all the signals
		sigprocmask(SIG_UNBLOCK, &newset, NULL);  // unblock
		sleep(3); // let all queued signals be delivered
		exit(0);  // 不退出，子进程会继续往下执行
	}
	sleep(3); // let child block all signals
	for (i = SIGRTMAX; i >= SIGRTMAX - 2; i--)
	{
		for (j = 0; j <= 2; j++)
		{
			val.sival_int = j;
			sigqueue(pid, i, val);
			printf("sent signal %d, val = %d\n", i, j);
		}
	}



	exit(EXIT_SUCCESS);
}

	Sigfunc_rt *
signal_rt(int signo, Sigfunc_rt *func, sigset_t *mask)
{
	struct sigaction act, oact;
	//    man sigaction;
	//    struct sigaction {
	//    	void     (*sa_handler)(int);
	//    	void     (*sa_sigaction)(int, siginfo_t *, void *);
	//    	sigset_t   sa_mask;
	//    	int        sa_flags;
	//    	void     (*sa_restorer)(void);
	//    };

	act.sa_sigaction = func; 
	act.sa_mask = *mask;
	act.sa_flags = SA_SIGINFO;
	if (signo == SIGALRM)
	{
#ifdef SA_INTERRUP
		act.sa_flags |= SA_INTERRUP;
#endif
	}
	else
	{
#ifdef SA_RESTART
		act.sa_flags |= SA_RESTART;
#endif
	}

	if (sigaction(signo, &act, &oact) < 0)
	{
		return( (Sigfunc_rt*) SIG_ERR);
	}

	return oact.sa_sigaction;
}

// man sigaction
//    siginfo_t {
//    	int      si_signo;    /* Signal number */
//    	int      si_errno;    /* An errno value */
//    	int      si_code;     /* Signal code */
//    	int      si_trapno;   /* Trap number that caused
//    							 hardware-generated signal
//    							 (unused on most architectures) */
//    	pid_t    si_pid;      /* Sending process ID */
//    	uid_t    si_uid;      /* Real user ID of sending process */
//    	int      si_status;   /* Exit value or signal */
//    	clock_t  si_utime;    /* User time consumed */
//    	clock_t  si_stime;    /* System time consumed */
//    	sigval_t si_value;    /* Signal value */
//    	int      si_int;      /* POSIX.1b signal */
//    	void    *si_ptr;      /* POSIX.1b signal */
//    	int      si_overrun;  /* Timer overrun count; POSIX.1b timers */
//    	int      si_timerid;  /* Timer ID; POSIX.1b timers */
//    	void    *si_addr;     /* Memory location which caused fault */
//    	long     si_band;     /* Band event (was int in
//    							 glibc 2.3.2 and earlier) */
//    	int      si_fd;       /* File descriptor */
//    	short    si_addr_lsb; /* Least significant bit of address
//    							 (since Linux 2.6.32) */
//    }
//


static void sig_rt(int signo, siginfo_t * info, void * context)
{
	printf("\nreceived signal #%d, si_signo #%d, code = %d, ival = %d\n",
			signo, info->si_signo, info->si_code, info->si_value.sival_int);
}








