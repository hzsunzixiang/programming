#include	"pthread_rwlock.h"
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

pthread1_rwlock_t	rwlock = PTHREAD1_RWLOCK_INITIALIZER;

void	 *thread1(void *), *thread2(void *);
pthread_t	tid1, tid2;

int
main(int argc, char **argv)
{
	void	*status;
	Pthread_rwlock_init(&rwlock, NULL);

	//set_concurrency(2);
	pthread_create(&tid1, NULL, thread1, NULL);
	sleep(1);		/* let thread1() get the lock */
	pthread_create(&tid2, NULL, thread2, NULL);

	pthread_join(tid2, &status);
	if (status != PTHREAD_CANCELED)
		printf("thread2 status = %p\n", status);
	pthread_join(tid1, &status);
	if (status != NULL)
		printf("thread1 status = %p\n", status);

	printf("rw_refcount = %d, rw_nwaitreaders = %d, rw_nwaitwriters = %d\n",
		   rwlock.rw_refcount, rwlock.rw_nwaitreaders,
		   rwlock.rw_nwaitwriters);
	Pthread_rwlock_destroy(&rwlock);
		/* returns EBUSY error if cancelled thread does not cleanup */

	exit(0);
}

void *
thread1(void *arg)
{
	Pthread_rwlock_rdlock(&rwlock);
	printf("thread1() got a read lock\n");
	sleep(3);		/* let thread2 block in pthread_rwlock_wrlock() */
	pthread_cancel(tid2);
	sleep(3);

	// 当第二个线程被取消时， 它持有包含在读写锁中的互斥锁，
	// 去掉 unlock调用，主线程将输出
	//
	// p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/my_rwlock$ ./testcancel
	// thread1() got a read lock
	// thread2() trying to obtain a write lock
	// rw_refcount = 1, rw_nwaitreaders = 0, rw_nwaitwriters = 1
	// pthread_rwlock_destroy error: Device or resource busy
	Pthread_rwlock_unlock(&rwlock);
	return(NULL);
}

void *
thread2(void *arg)
{
	printf("thread2() trying to obtain a write lock\n");
	Pthread_rwlock_wrlock(&rwlock);
	// 被取消，永远到不了这里
	printf("thread2() got a write lock\n");
	sleep(1);
	Pthread_rwlock_unlock(&rwlock);
	return(NULL);
}
