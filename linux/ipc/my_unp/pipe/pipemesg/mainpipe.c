#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


/*
 * The  following program creates a pipe, and then fork(2)s to create a child process; the child inherits a duplicate set of file descriptors that refer to the same pipe.  After the
 * fork(2), each process closes the descriptors that it doesn't need for the pipe (see pipe(7)).  The parent then writes the string contained in the program's command-line  argument
 * to the pipe, and the child reads this string a byte at a time from the pipe and echoes it on standard output.
 *
 * */
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
void client(int readfd, int writefd);
void server(int readfd, int writefd);
	int
main(int argc, char *argv[])
{
	int pipe1[2], pipe2[2];;
	pid_t childpid;


	if (pipe(pipe1) == -1) {
		perror("pipe1");
		exit(EXIT_FAILURE);
	}
	if (pipe(pipe2) == -1) {
		perror("pipe2");
		exit(EXIT_FAILURE);
	}

	childpid = fork();
	if (childpid == -1) {
		perror("fork");
		exit(EXIT_FAILURE);
	}

	if (childpid == 0) {    /* Child reads from pipe */
		fprintf(stderr, "child......\n");
		close(pipe1[1]);          /* Close unused write end */
		close(pipe2[0]);          /* Close unused read end */

		server(pipe1[0], pipe2[1]);
		_exit(EXIT_SUCCESS);

	} else {            /* Parent writes argv[1] to pipe */
		fprintf(stderr, "parent......\n");
		// 父进程关闭读的一端
		close(pipe1[0]);          /* Close unused read end */
		close(pipe2[1]);          /* Close unused write end */
		client(pipe2[0], pipe1[1]);

		waitpid(childpid, NULL, 0);                /* Wait for child */
		exit(EXIT_SUCCESS);
	}
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
		fprintf(stderr, "msg_send error :\n");
		exit(1);
	}

	/* 4read from IPC, write to standard output */
	while ( (n = mesg_recv(readfd, &mesg)) > 0)
		write(STDOUT_FILENO, mesg.mesg_data, n);
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
}
