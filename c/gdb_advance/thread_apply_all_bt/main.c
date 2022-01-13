#include <stdio.h>
#include <pthread.h>
#include <time.h>

#define THREAD_SLEEP(ms) {\
	struct timespec delay ;\
	delay.tv_sec = ms / 1000 ;\
	delay.tv_nsec = ((ms % 1000)*1000000) ;\
	nanosleep(&delay,NULL) ;\
}

pthread_t th1 ;
pthread_t th2 ;

void* threadFunction1(void* arg)
{
	printf("\nthreadFunction1(): %lu\n", pthread_self());
	while(1)
	{
		THREAD_SLEEP(10);
	}
	return NULL ;
}

void* threadFunction2(void* arg)
{
	printf("\nthreadFunction2(): %lu\n", pthread_self());
	while(1)
	{
		THREAD_SLEEP(10);
	}
	return NULL ;
}

int main(void)
{
	printf("\nmain(): %lu\n", pthread_self());
	pthread_create(&th1, NULL, &threadFunction1, NULL) ;
	pthread_create(&th2, NULL, &threadFunction2, NULL) ;
	while(1)
	{
		THREAD_SLEEP(10);
	}
	pthread_join(th1, NULL );
	pthread_join(th2, NULL );
	return 0 ;
}


//(gdb) run
//Starting program: /home/ericksun/programming/c/gdb_advance/thread_apply_all_bt/main
//Missing separate debuginfos, use: yum debuginfo-install glibc-2.28-164.el8.x86_64
//[Thread debugging using libthread_db enabled]
//Using host libthread_db library "/lib64/libthread_db.so.1".
//
//main(): 140737354032960
//[New Thread 0x7ffff77ea700 (LWP 386591)]
//
//threadFunction1(): 140737345660672
//[New Thread 0x7ffff6fe9700 (LWP 386592)]
//
//threadFunction2(): 140737337267968
//^C
//Thread 1 "main" received signal SIGINT, Interrupt.
//0x00007ffff7bc20b0 in nanosleep () from /lib64/libpthread.so.0
//(gdb) thread apply all bt
//
//Thread 3 (Thread 0x7ffff6fe9700 (LWP 386592)):
//#0  0x00007ffff7bc20b0 in nanosleep () from /lib64/libpthread.so.0
//#1  0x0000000000400730 in threadFunction2 (arg=0x0) at main.c:30
//#2  0x00007ffff7bb817a in start_thread () from /lib64/libpthread.so.0
//#3  0x00007ffff78e7dc3 in clone () from /lib64/libc.so.6
//
//Thread 2 (Thread 0x7ffff77ea700 (LWP 386591)):
//#0  0x00007ffff7bc20b0 in nanosleep () from /lib64/libpthread.so.0
//#1  0x00000000004006ea in threadFunction1 (arg=0x0) at main.c:20
//#2  0x00007ffff7bb817a in start_thread () from /lib64/libpthread.so.0
//#3  0x00007ffff78e7dc3 in clone () from /lib64/libc.so.6
//
//Thread 1 (Thread 0x7ffff7fe6740 (LWP 386586)):
//#0  0x00007ffff7bc20b0 in nanosleep () from /lib64/libpthread.so.0
//#1  0x00000000004007a4 in main () at main.c:42

