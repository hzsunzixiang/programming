#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<fcntl.h>




//  里面的错误信息提示不完整
#define FIFO1 "/tmp/fifo.1"
#define FIFO2 "/tmp/fifo.2"
#define MAXLINE 4096
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
/*
 * The  following program creates a pipe, and then fork(2)s to create a child process; the child inherits a duplicate set of file descriptors that refer to the same pipe.  After the
 * fork(2), each process closes the descriptors that it doesn't need for the pipe (see pipe(7)).  The parent then writes the string contained in the program's command-line  argument
 * to the pipe, and the child reads this string a byte at a time from the pipe and echoes it on standard output.
 *
 * */
void client(int readfd, int writefd);
void server(int readfd, int writefd);
	int
main(int argc, char *argv[])
{
	int readfd, writefd; 
	pid_t childpid;

	// create two FIFOs; OK if they already exist
	//
	if ((mkfifo(FIFO1, 0666) < 0) && (errno != EEXIST))
	{
		perror("mkfifo 1");
		exit(EXIT_FAILURE);
	}

	if ((mkfifo(FIFO2, 0666) < 0) && (errno != EEXIST))
	{
		perror("mkfifo 2");
		exit(EXIT_FAILURE);
	}
	childpid = fork();
	if (childpid == -1) {
		perror("fork");
		exit(EXIT_FAILURE);
	}

	if (childpid== 0) {    /* Child reads from pipe */
		readfd = open(FIFO1, O_RDONLY, 0);
		writefd = open(FIFO2, O_WRONLY, 0);
		server(readfd, writefd);
		_exit(EXIT_SUCCESS);

	}             /* Parent writes argv[1] to pipe */
	fprintf(stderr, "parent......\n");
	// 父进程关闭读的一端
	// 不处理错误了
	writefd = open(FIFO1, O_WRONLY, 0); // 如果这里携程O_RDONLY 会死锁
	readfd = open(FIFO2, O_RDONLY, 0);
	client(readfd, writefd);

	waitpid(childpid, NULL, 0);                /* Wait for child */
	unlink(FIFO1);
	unlink(FIFO2);
	exit(EXIT_SUCCESS);
}


void
client(int readfd, int writefd)
{
	size_t	len;
	ssize_t	n;
	struct mymesg	mesg;

	// A newline character makes fgets stop reading, but it is considered a valid character by the function and included in the string copied to str.
	//
	// A terminating null character is automatically appended after the characters copied to str.
	//char * ret = fgets(buff, MAXLINE, stdin);
	fgets(mesg.mesg_data, MAXMESGDATA, stdin);
	len = strlen(mesg.mesg_data);
	if (mesg.mesg_data[len-1] == '\n')
	{
		len--;				/* delete newline from fgets() */
	}
	mesg.mesg_len = len;
	mesg.mesg_type = 1;

	/* 4write pathname to IPC channel */
	if ( (n = mesg_send(writefd, &mesg)) != (MESGHDRSIZE + len))
	{
		fprintf(stderr, "msg_send error :");
		exit(1);
	}

	/* 4read from IPC, write to standard output */
	while ( (n = mesg_recv(readfd, &mesg)) > 0)
		write(STDOUT_FILENO, mesg.mesg_data, n);
	fprintf(stderr, "client while finish:\n");
}


	ssize_t
mesg_send(int fd, struct mymesg *mptr)
{
	return(write(fd, mptr, MESGHDRSIZE + mptr->mesg_len));
}
/* end mesg_send */


ssize_t
mesg_recv(int fd, struct mymesg *mptr)
{
	size_t	len;
	ssize_t	n;

	/* 4read message header first, to get len of data that follows */
	// 不处理错误了，
	if ( (n = read(fd, mptr, MESGHDRSIZE)) == 0)
		return(0);		/* end of file */
	else if (n != MESGHDRSIZE)
	{
		perror("message header: error");
		exit(1);
	}

	if ( (len = mptr->mesg_len) > 0)
		if ( (n = read(fd, mptr->mesg_data, len)) != len)
		{
			perror("message data: error");
			return -1;
		}
	return(len);
}
/* end mesg_recv */



	void
server(int readfd, int writefd)
{
	FILE	*fp;
	ssize_t	n;
	struct mymesg	mesg;

	/* 4read pathname from IPC channel */
	mesg.mesg_type = 1;
	if ( (n = mesg_recv(readfd, &mesg)) == 0)
	{
		perror("pathname missing");
		exit(1);
	}
	mesg.mesg_data[n] = '\0';	/* null terminate pathname */

	if ( (fp = fopen(mesg.mesg_data, "r")) == NULL) {
		/* 4error: must tell client */
		snprintf(mesg.mesg_data + n, sizeof(mesg.mesg_data) - n,
				": can't open, %s\n", strerror(errno));
		mesg.mesg_len = strlen(mesg.mesg_data);
		mesg_send(writefd, &mesg);

	} else {
		/* 4fopen succeeded: copy file to IPC channel */
		while (fgets(mesg.mesg_data, MAXMESGDATA, fp) != NULL) {
			mesg.mesg_len = strlen(mesg.mesg_data);
			//mesg_send(writefd, &mesg);

			if ( (n = mesg_send(writefd, &mesg)) != (MESGHDRSIZE + mesg.mesg_len))
			{
				perror("msg_send :");
				exit(1);
			}
		}
		fclose(fp);
	}

	/* 4send a 0-length message to signify the end */
	mesg.mesg_len = 0;
	if ( (n = mesg_send(writefd, &mesg)) != (MESGHDRSIZE + mesg.mesg_len))
	{
		fprintf(stderr, "msg_send error :\n");
		exit(1);
	}
	// 也可以通过关闭IPC通道来通知对端已达到输入文件的结尾
	// 不过我们通过发送回一个长度为0的消息来达到同样的目的，因为之后还会遇到没有文件结束符概念的其他类型的IPC
	// 用sleep 可以模拟，如果不只是达到文件结尾 client 的while循环不会返回
	
	//close(writefd);

	//sleep(10);
	





}
