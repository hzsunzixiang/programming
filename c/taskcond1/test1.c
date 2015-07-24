#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>
#include <assert.h>
#include <signal.h>

#include"task.h"

#define ERR_EXIT(m) \
	do \
{ \
	perror(m); \
	exit(EXIT_FAILURE); \
} while(0)


void* task1(void *param)
{
	printf("taskid=%d\n",(int)param);
	return NULL;
}

int test_basic();
int test_robust();
int main()
{
	printf("the basic test\n");
	sleep(2);
	(void)test_basic();

	printf("the basic test success\n");
	sleep(2);

	printf("the robust test\n");
	sleep(2);
	(void)test_robust();

	printf("the robust test success\n");
	sleep(2);
	return 0;
}


int test_basic()

{
	task_info *info1=(task_info*)malloc(sizeof(task_info));


	//initialize the signal
	//signal_init();

	// initialize the  task
	info1->task=task1;
	info1->tv.tv_sec = 5;
	info1->tv.tv_usec = 0;
	info1->arg=(int *)100;


	if( task_start(info1) )
		ERR_EXIT("task_start task1 failure!");
	sleep(1);
	printf("wakeup serval times\n");
	//wake up several times
	if(task_wakeup(info1))
		ERR_EXIT("task_wakeup task1 failure!");
	if(task_wakeup(info1))
		ERR_EXIT("task_wakeup task1 failure!");
	if(task_wakeup(info1))
		ERR_EXIT("task_wakeup task1 failure!");




	sleep(1);
	printf("the nomal flow\n");
	sleep(10);

	//suspend the task
	if(task_suspend(info1))
		ERR_EXIT("task_suspend task1 failure!");
	printf("be suspend here for 30 seconds\n");

	sleep(30);

	printf("will be resume here\n");
	//resume the task
	if(task_resume(info1))
		ERR_EXIT("task_resume task1 failure!");


	sleep(20);
	if(task_suspend(info1))
		ERR_EXIT("task_suspend task1 failure!");
	printf("be suspend here for 10 seconds\n");
	sleep(10);
	printf("be stop here\n");
	//stop the task
	if(task_stop(info1))
		ERR_EXIT("task_stop task1 failure!");

	//join the tasks 
	pthread_join(info1->tid,NULL);
	return 0;
}


int test_robust()
{


	//int num=500;
	//int num=FD_SETSIZE;
	int num=2000;
	task_info *tasks[num];
	int loop;

	for(loop=0;loop<num;++loop)
	{
		task_info *info1=(task_info*)malloc(sizeof(task_info));
		// initialize the  task
		info1->task=task1;
		info1->tv.tv_sec =2 ;
		info1->tv.tv_usec =0;
		info1->arg=(int *)loop;

		tasks[loop]=info1;


	}
	for(loop=0;loop<num;++loop)
	{
		if( task_start(tasks[loop]) )
			ERR_EXIT("task_start task1 failure!");
	}
	printf("will be wakeup here for several times\n");
	sleep(10);
	for(loop=0;loop<1;++loop)
	{
		if(task_wakeup(tasks[loop]))
			ERR_EXIT("task_suspend task1 failure!");
	}
	sleep(10);
	printf("will be suspended here for 10 seconds\n");
	sleep(10);
	for(loop=0;loop<num;++loop)
	{
		if(task_suspend(tasks[loop]))
			ERR_EXIT("task_suspend task1 failure!");
	}
	sleep(10);
	printf("will be resumed here\n");
	sleep(2);
	for(loop=0;loop<num;++loop)
	{
		if(task_resume(tasks[loop]))
			ERR_EXIT("task_resume task1 failure!");
	}
	sleep(10);
	printf("will be stop here\n");
	sleep(2);
	for(loop=0;loop<num;++loop)
	{
		if(task_stop(tasks[loop]))
			ERR_EXIT("task_stop task1 failure!");
	}
	for(loop=0;loop<num;++loop)
	{
		pthread_join(tasks[loop]->tid,NULL);
	}
	return 0;

}
