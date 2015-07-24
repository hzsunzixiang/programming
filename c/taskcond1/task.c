#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/types.h>
#include <pthread.h>
#include <assert.h>
#include <signal.h>
#include <fcntl.h>

#include <errno.h>
#include <string.h>

#include"task.h"



void *process(void *arg)
{
	task_info *info=(task_info*)arg;

	struct timeval now;
	struct timespec outtime;
	struct timeval tv;
	/* Wait up to specified  seconds. */
	tv.tv_sec = info->tv.tv_sec;
	tv.tv_usec =info->tv.tv_usec;
	info->taskflag=1;

	info->suspendflag=0;
	while (info->taskflag) {
		gettimeofday(&now, NULL);
		outtime.tv_sec = now.tv_sec + tv.tv_sec;
		outtime.tv_nsec = (now.tv_usec+tv.tv_usec) * 1000;

		if(  pthread_mutex_lock(&(info->mutex)))
			perror("lock error");
		int retval=pthread_cond_timedwait(&(info->cond), &(info->mutex), &outtime);

		if(retval==0)
		{
			//printf("receive signal!\n");
			(info->task)(info->arg);
		}
		else if(retval==ETIMEDOUT)
		{
			//printf("ETIMEDOUT:%d\n",ETIMEDOUT);
			(info->task)(info->arg);
		}
		else{
			perror("cond_timed wait error");

		}
		if( pthread_mutex_unlock(&(info->mutex)) )
			perror("unlock error");
		//printf("suspendflag:\t%d\n",info->suspendflag);

		if(info->suspendflag)
		{

			//printf("will be suspend here\n");
			if(  pthread_mutex_lock(&(info->suspendmutex)))
				perror("lock error");
			pthread_cond_wait(&(info->suspendcond), &(info->suspendmutex));
			if(  pthread_mutex_unlock(&(info->suspendmutex)))
				perror("unlock error");
			//printf("out here\n");
		}
	}
	return NULL;

}
int task_start (task_info *info)
{
	pthread_mutex_init(&(info->mutex), NULL);
	pthread_cond_init(&(info->cond), NULL);
	pthread_mutex_init(&(info->suspendmutex), NULL);
	pthread_cond_init(&(info->suspendcond), NULL);
	return pthread_create( &(info->tid), NULL, process,info); 
}

int task_wakeup(task_info * info)
{
	if(pthread_mutex_lock(&(info->mutex)))
		perror("lock error");
	if(pthread_cond_signal(&(info->cond)))
		perror("cond_signal error");
	if(pthread_mutex_unlock(&(info->mutex)))
		perror("lock error");
	return 0;
}
int task_suspend(task_info *info)
{
	if(pthread_mutex_lock(&(info->suspendmutex)))
		perror("lock error");

	info->suspendflag=1;
	//printf("int task_suspend suspendflag:\t%d\n",info->suspendflag);

	if(pthread_mutex_unlock(&(info->suspendmutex)))
		perror("unlock error");
	return 0; 

}
int task_resume( task_info *info)
{
	if(pthread_mutex_lock(&(info->suspendmutex)))
		perror("lock error");

	info->suspendflag=0;

	if(pthread_cond_signal(&(info->suspendcond)))
		perror("cond_signal error");

	if(pthread_mutex_unlock(&(info->suspendmutex)))
		perror("unlock error");
	//int code=pthread_kill (info->tid, SIGRESUME);
	//return code;
	return 0;
}
int task_stop (task_info *info)
{
	task_resume(info);
	info->taskflag=0;
	return 0;
}
