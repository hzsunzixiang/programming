#include <sys/wait.h>
#include <sys/msg.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<fcntl.h>




//  里面的错误信息提示不完整
#define MQ_KEY1 1234L
#define MAXLINE 4096

// 之所以有pipe字样，是复用 了pipe中的字段
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
void client(int readfd, int writefd);
	int
main(int argc, char *argv[])
{
	int readid, writeid; 
	//
	// server must create its well-known queue
	writeid = msgget(MQ_KEY1, 0);
	if (writeid < 0)
	{
		perror("msgget 1");
		exit(EXIT_FAILURE);
	}
	// we create our own private queue
	readid = msgget(IPC_PRIVATE, 0666 | IPC_CREAT);
	if (readid < 0)
	{
		perror("msgget 1");
		exit(EXIT_FAILURE);
	}

	client(readid, writeid);
	// and delete our private queue
	int ret = msgctl(readid, IPC_RMID, NULL);
	if (ret < 0)
	{
		perror("msgctl 1");
		exit(EXIT_FAILURE);
	}

	exit(EXIT_SUCCESS);
}


	ssize_t
mesg_send(int id, struct mymesg *mptr)
{
	int ret = msgsnd(id, &(mptr->mesg_type),  mptr->mesg_len, 0);
	//		if ( (n = mesg_send(writefd, &mesg)) != (MESGHDRSIZE + mesg.mesg_len))
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
client(int readid, int writeid)
{
	size_t	len;
	ssize_t	n;
	char *ptr;
	struct mymesg	mesg;


	// start buffer with pid and a blank
	snprintf(mesg.mesg_data, MAXMESGDATA, "%d ", readid);
	len = strlen(mesg.mesg_data);
	ptr = mesg.mesg_data + len;
	// A newline character makes fgets stop reading, but it is considered a valid character by the function and included in the string copied to str.
	//
	// A terminating null character is automatically appended after the characters copied to str.
	//char * ret = fgets(buff, MAXLINE, stdin);
	fgets(ptr, MAXMESGDATA - len, stdin);
	len = strlen(mesg.mesg_data);
	if (mesg.mesg_data[len-1] == '\n')
	{
		len--;				/* delete newline from fgets() */
	}
	mesg.mesg_len = len;
	mesg.mesg_type = 1;

	/* 4write pathname to IPC channel */
	if ( (n = mesg_send(writeid, &mesg)) != (MESGHDRSIZE + len))
	{
		fprintf(stderr, "msg_send error :");
		exit(1);
	}
	mesg.mesg_type = readid;

	/* 4read from IPC, write to standard output */
	while ( (n = mesg_recv(readid, &mesg)) > 0)
		write(STDOUT_FILENO, mesg.mesg_data, n);
	fprintf(stderr, "client while finish:\n");
}


