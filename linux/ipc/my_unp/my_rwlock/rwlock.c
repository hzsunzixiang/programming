/*DATE:            
 *AUTHOR:        DDDDD
 *DESCRIPTION: 验证可以有多个线程同时拥有读模式下的读锁
 *    读写锁在使用之前必须初始化
 *    int pthread_rwlock_init(pthread_rwlock_t *restrict rwlock,
 *     const pthread_rwlockattr_t *restrict attr);
 *    成功返回0 ，失败返回错误码
 *    
 *    使用完需要销毁
 *    int pthread_rwlock_destroy(pthread_rwlock_t *rwlock);
 *    成功返回0 ，失败返回错误码
 *
 *    读模式加锁
 *    int pthread_rwlock_rdlock(pthread_rwlock_t *rwlock);
 *    int pthread_rwlock_tryrdlock(pthread_rwlock_t *rwlock);
 *    写模式加锁
 *    int pthread_rwlock_wrlock(pthread_rwlock_t *rwlock);
 *    int pthread_rwlock_trywrlock(pthread_rwlock_t *rwlock);
 *    解锁
 *    int pthread_rwlock_unlock(pthread_rwlock_t *rwlock);
 */

#include	"pthread_rwlock.h"

#include	<sys/types.h>	/* basic system data types */
#include	<sys/time.h>	/* timeval{} for select() */
#include	<time.h>		/* timespec{} for pselect() */
#include	<fcntl.h>		/* for nonblocking */
#include	<limits.h>		/* PIPE_BUF */
#include	<signal.h>
#include	<errno.h>
#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>
#include	<sys/stat.h>	/* for S_xxx file mode constants */
#include	<unistd.h>
#include	<sys/wait.h>
#include	<pthread.h>


#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

pthread1_rwlock_t rwlock;
int num=0;

void *thread_fun1(void *arg)
{
	int err = 0;
	int i = (int)arg;
	printf("before acqure read lock\n");
	err = pthread1_rwlock_rdlock(&rwlock);
	if(err)
	{
		handle_error("pthread_rwlock_rdlock failed\n");
	}
	printf("thread_fun1 %d  print num %d\n", i, num);
	sleep(5);
	printf("thread_fun1 %d over\n", i);

	err = pthread1_rwlock_unlock(&rwlock);
	if(err)
	{
		handle_error("pthread_rwlock_unlock failed\n");
	}
	return (void *)1;
}

void *thread_fun2(void *arg)
{
	int err = 0;
	int i = (int)arg;
	printf("before acqure write lock\n");
	err = pthread1_rwlock_wrlock(&rwlock);
	if(err)
	{
		handle_error("pthread_rwlock_wrlock failed\n");
	}

	printf("thread_fun2 %d  print num %d\n", i, num);
	sleep(10);
	printf("thread_fun2 %d  is over\n", i);
	err = pthread1_rwlock_unlock(&rwlock);
	if(err)
	{
		handle_error("pthread_rwlock_unlock failed\n");
	}

	return (void *)1;
}

int main()
{
	pthread_t tid1, tid2;
	int err = 0;

	err = pthread1_rwlock_init(&rwlock, NULL);
	if(err)
	{
		handle_error("init rwlock failed\n");
	}
	
	int i = 0;
	for (i = 0; i < 5; i++ )
	{
		err = pthread_create(&tid1, NULL, thread_fun1, (void *)i);
		if(err)
		{
			handle_error("create new thread 1 failed\n");
		}
	}
	err = pthread_create(&tid2, NULL, thread_fun2, NULL);
	if(err)
	{
		handle_error("create new thread 2 failed\n");
	}

	// 系统自带的貌似是读锁优先
	// 这里自己实现的是写锁优先
	sleep(2);
	for (; i < 10; i++ )
	{
		err = pthread_create(&tid1, NULL, thread_fun1, (void *)i);
		if(err)
		{
			handle_error("create new thread 1 failed\n");
		}
	}
	pthread_join(tid1, NULL);
	pthread_join(tid2, NULL);

	pthread1_rwlock_destroy(&rwlock);

	return 0;
}


