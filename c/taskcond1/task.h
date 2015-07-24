
#ifndef TASK_H
#define TASK_H

#ifdef __cplusplus
extern "C" {
#endif


#define ERR_EXIT(m) \
	    do \
	{ \
		    perror(m); \
		    exit(EXIT_FAILURE); \
	} while(0)

typedef void *(*funptr)(void *);

struct  task_info ;

typedef  struct  task_info {
	pthread_t tid;
	int taskflag;
	int suspendflag;
	pthread_cond_t cond;
	pthread_cond_t suspendcond;
	pthread_mutex_t mutex;
	pthread_mutex_t suspendmutex;
	//int  flag ;
	struct timeval tv;
	funptr task;
	void *arg; //the parameter for function "funptr"
}task_info;


//int task_start (task_info *info,void *(*process) (void *arg), void *arg);
int task_start(task_info * info);

int task_suspend(task_info * info);

int task_resume(task_info *  info);

int task_wakeup(task_info * info);

int task_stop (task_info * info);

#ifdef __cplusplus
extern "C" {
#endif


#endif
