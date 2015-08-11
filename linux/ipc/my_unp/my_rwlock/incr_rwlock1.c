/* include main */
#include	"pthread_rwlock.h"		/* our implementation header */
#include	<sys/types.h>	/* basic system data types */
#include	<sys/time.h>	/* timeval{} for select() */
#include	<time.h>		/* timespec{} for pselect() */
#include	<errno.h>
#include	<fcntl.h>		/* for nonblocking */
#include	<limits.h>		/* PIPE_BUF */
#include	<signal.h>
#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>
#include	<sys/stat.h>	/* for S_xxx file mode constants */
#include	<unistd.h>
#include	<sys/wait.h>
#include	<pthread.h>


#define      min(a,b)        ((a) < (b) ? (a) : (b))

static struct timeval	tv_start, tv_stop;
	void
tv_sub(struct timeval *out, struct timeval *in)
{
	if ( (out->tv_usec -= in->tv_usec) < 0) {   /* out -= in */
		--out->tv_sec;
		out->tv_usec += 1000000;
	}
	out->tv_sec -= in->tv_sec;
}

	int
start_time(void)
{
	return(gettimeofday(&tv_start, NULL));
}

	double
stop_time(void)
{
	double	clockus;

	if (gettimeofday(&tv_stop, NULL) == -1)
		return(0.0);
	tv_sub(&tv_stop, &tv_start);
	clockus = tv_stop.tv_sec * 1000000.0 + tv_stop.tv_usec;
	return(clockus);
}

	void
Start_time(void)
{
	if (start_time() == -1)
		err_sys("start_time error");
}

	double
Stop_time(void)
{
	double	clockus;

	if ( (clockus = stop_time()) == 0.0)
		err_sys("stop_time error");
	return(clockus);
}

#define	MAXNTHREADS	100

int		nloop;

struct {
	pthread1_rwlock_t	rwlock;
	long	counter;
} shared = { PTHREAD1_RWLOCK_INITIALIZER };

void	*incr(void *);

	int
main(int argc, char **argv)
{
	int		i, nthreads;
	pthread_t	tid[MAXNTHREADS];

	if (argc != 3)
	{
		fprintf(stderr, "usage: incr_rwlock1 <#loops> <#threads>");
		exit(EXIT_FAILURE);
	}
	nloop = atoi(argv[1]);
	nthreads = min(atoi(argv[2]), MAXNTHREADS);

	/* obtain write lock */
	Pthread_rwlock_wrlock(&shared.rwlock);

	/* create all the threads */
	//Set_concurrency(nthreads);
	for (i = 0; i < nthreads; i++) {
		pthread_create(&tid[i], NULL, incr, NULL);
	}
	/* start the timer and release the write lock */
	Start_time();
	// 写锁释放之后，线程才可以运行
	Pthread_rwlock_unlock(&shared.rwlock);

	/* wait for all the threads */
	for (i = 0; i < nthreads; i++) {
		pthread_join(tid[i], NULL);
	}
	printf("microseconds: %.0f usec\n", Stop_time());
	if (shared.counter != nloop * nthreads)
		printf("error: counter = %ld\n", shared.counter);
	else
		printf("success: counter = %ld\n", shared.counter);


	exit(0);
}
/* end main */

/* include incr */
	void *
incr(void *arg)
{
	int		i;

	for (i = 0; i < nloop; i++) {
		Pthread_rwlock_wrlock(&shared.rwlock);
		shared.counter++;
		Pthread_rwlock_unlock(&shared.rwlock);
	}
	return(NULL);
}
/* end incr */
