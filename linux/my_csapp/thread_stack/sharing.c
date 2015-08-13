/* $begin sharing */
#include <pthread.h> 
#include <stdio.h> 
#include <stdlib.h> 
#include <sys/shm.h>


#define	SHM_SIZE	100000
#define	SHM_MODE	0600	/* user read/write */
#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define ADDR(address) (void *)(address), (unsigned long)(address)/1024/1024, (unsigned long)(address)/1024/1024/1024

#define N 10
void *thread(void *vargp);

char **ptr;  /* global variable */ //line:conc:sharing:ptrdec

int main() 
{
    int i;  
	int		shmid;
	char	*shmptr;
    pthread_t tid;
    char *msgs[N] = {
	"Hello from foo",  
	"Hello from bar"   
    };

	if ((shmid = shmget(IPC_PRIVATE, SHM_SIZE, SHM_MODE)) < 0)
		err_sys("shmget error");
	if ((shmptr = shmat(shmid, 0, 0)) == (void *)-1)
		err_sys("shmat error");
	printf("shared memory attached from %p(%luM, %luG) to %p(%luM, %luG)\n", ADDR(shmptr), ADDR((void *)shmptr + SHM_SIZE));
	printf("stack around maste %p(%luM,%luG) \n", ADDR(&i));
    ptr = msgs; 
    for (i = 0; i < N; i++)  
        pthread_create(&tid, NULL, thread, (void *)i); 
    pthread_exit(NULL); 
}

void *thread(void *vargp) 
{
    int myid = (int)vargp % 2;
	printf("stack around  thread %p(%luM,%luG) \n", ADDR(&myid));
    static int cnt = 0; //line:conc:sharing:cntdec
    printf("[%d]: %s (cnt=%d)\n", myid, ptr[myid], ++cnt); //line:conc:sharing:stack
    return NULL;
}
/* $end sharing */


//   root@debian32-1:~/programming/linux/my_csapp/thread_stack# ./sharing
//   shared memory attached from 0x401ba000(1025M, 1G) to 0x401d26a0(1025M, 1G)
//   stack around maste 0xbffff684(3071M,2G)
//   stack around  thread 0x40fd234c(1039M,1G)
//   [0]: Hello from foo (cnt=1)
//   stack around  thread 0x40dd234c(1037M,1G)
//   [1]: Hello from bar (cnt=2)
//   stack around  thread 0x411d234c(1041M,1G)
//   [1]: Hello from bar (cnt=3)
//   stack around  thread 0x415d234c(1045M,1G)
//   [1]: Hello from bar (cnt=4)
//   stack around  thread 0x40bd234c(1035M,1G)
//   [0]: Hello from foo (cnt=5)
//   stack around  thread 0x413d234c(1043M,1G)
//   [0]: Hello from foo (cnt=6)
//   stack around  thread 0x409d234c(1033M,1G)
//   [1]: Hello from bar (cnt=7)
//   stack around  thread 0x407d234c(1031M,1G)
//   [0]: Hello from foo (cnt=8)
//   stack around  thread 0x405d234c(1029M,1G)
//   [1]: Hello from bar (cnt=9)
//   stack around  thread 0x403d234c(1027M,1G)
//   [0]: Hello from foo (cnt=10)

