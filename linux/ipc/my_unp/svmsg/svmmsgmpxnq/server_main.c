#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include<signal.h>

#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<fcntl.h>
#include<sys/msg.h>



typedef void Sigfunc(int);
Sigfunc *
signal(int signo, Sigfunc *func);

void sig_chld(int signum)
{
	pid_t pid;
	int stat;
	
	//pid = wait(&stat);
	//printf("child %d terminated\n", pid);
	
	while ( (pid = waitpid(-1, &stat, WNOHANG)) > 0)
	{
		printf("child %d terminated\n", pid);
	}
	return;

}

//  里面的错误信息提示不完整
#define MQ_KEY1 1234L

#define MAXLINE 4096

// 之所以有pipe字样，是复用了pipe中的字段
#define PIPE_BUF 4096
/* Our own "messages" to use with pipes, FIFOs, and message queues. */

	/* 4want sizeof(struct mymesg) <= PIPE_BUF */
#define	MAXMESGDATA	(PIPE_BUF - 2*sizeof(long))

	/* 4length of mesg_len and mesg_type */
#define	MESGHDRSIZE	(sizeof(struct mymesg) - MAXMESGDATA)

struct mymesg {
  long	mesg_len;	/* #bytes in mesg_data, can be 0 */
  long	mesg_type;	/* message type, must be > 0 */
  char	mesg_data[MAXMESGDATA];
};

ssize_t	 mesg_send(int, struct mymesg *);
ssize_t	 mesg_recv(int, struct mymesg *);
void server(int readfd, int writefd);
	int
main(int argc, char *argv[])
{
	int msqid; 
    if (signal(SIGCHLD, sig_chld) == SIG_ERR)  // 忽略 在linux下起作用，但不可移植
        perror("signal:");
	//
	msqid = msgget(MQ_KEY1, 0666 | IPC_CREAT);
	if (msqid < 0)
	{
		perror("msgget 1");
		exit(EXIT_FAILURE);
	}

	server(msqid, msqid);

	exit(EXIT_SUCCESS);
}




	ssize_t
mesg_send(int id, struct mymesg *mptr)
{
	int ret = msgsnd(id, &(mptr->mesg_type),  mptr->mesg_len, 0);
	//server中 		if ( (n = mesg_send(writefd, &mesg)) != (MESGHDRSIZE + mesg.mesg_len))
	if(ret == 0) // 为了配合server函数中的
	{
		ret = MESGHDRSIZE + mptr->mesg_len;
	}
	return ret;
}
/* end mesg_send */


ssize_t
mesg_recv(int id, struct mymesg *mptr)
{
	ssize_t	n;
	n = msgrcv(id, &(mptr->mesg_type), MAXMESGDATA, mptr->mesg_type, 0);
	mptr->mesg_len = n;

	return(n);
}
/* end mesg_recv */



	void
server(int readid, int writeid)
{
	FILE	*fp;
	char *ptr;
	ssize_t	n;
	struct mymesg	mesg;

	for(; ;)
	{
		/* read pathname from IPC channel */
		mesg.mesg_type = 1;
		do {
			n = mesg_recv(readid, &mesg);
		} while(n == -1 && errno == EINTR);

		if (n == 0)
		{
			perror("pathname missing");
			continue;
		}
		mesg.mesg_data[n] = '\0';	/* null terminate pathname */
		fprintf(stderr, "mesg.mesg_data: %s\n", mesg.mesg_data);
		if ((ptr = strchr(mesg.mesg_data, ' ')) == NULL)
		{
			fprintf(stderr, "bogus request: %s", mesg.mesg_data);
			continue;
		}

		*ptr++ = 0;
		writeid = atoi(mesg.mesg_data);

		if(fork() == 0){
			if ( (fp = fopen(ptr, "r")) == NULL) {
				/* 4error: must tell client */
				fprintf(stderr, mesg.mesg_data + n, sizeof(mesg.mesg_data) - n,
						": can't open, %s\n", strerror(errno));
				mesg.mesg_len = strlen(ptr);
				memmove(mesg.mesg_data, ptr, mesg.mesg_len);
				mesg_send(writeid, &mesg);

			} else {
				/* fopen succeeded: copy file to IPC channel */
				while (fgets(mesg.mesg_data, MAXMESGDATA, fp) != NULL) {
					mesg.mesg_len = strlen(mesg.mesg_data);
					//mesg_send(writefd, &mesg);

					if ( (n = mesg_send(writeid, &mesg)) != (MESGHDRSIZE + mesg.mesg_len))
					{
						fprintf(stderr, "%s, message data: expect %ld,got %ld,\n", 
								strerror(n), (MESGHDRSIZE + mesg.mesg_len), n);
						exit(1);
					}
				}
				fprintf(stderr, "send to client finish qid %d:\n", writeid);
				fclose(fp);
			}

			/* send a 0-length message to signify the end */
			mesg.mesg_len = 0;
			if ( (n = mesg_send(writeid, &mesg)) != (MESGHDRSIZE + mesg.mesg_len))
			{
				fprintf(stderr, "msg_send error :%s\n", strerror(n));
				exit(1);
			}
			exit(0); // child teminaes  这句必须，不然子进程不退出，捕捉不到信号
		}

		// parent just loops around
	}
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
