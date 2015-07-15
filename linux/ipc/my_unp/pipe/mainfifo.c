#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<fcntl.h>

#define FIFO1 "/tmp/fifo.1"
#define FIFO2 "/tmp/fifo.2"
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



#define MAXLINE 4096
void client(int readfd, int writefd)
{
	size_t len;
	ssize_t n;
	char buff[MAXLINE];

	// A newline character makes fgets stop reading, but it is considered a valid character by the function and included in the string copied to str.
	//
	// A terminating null character is automatically appended after the characters copied to str.
	//char * ret = fgets(buff, MAXLINE, stdin);
	fgets(buff, MAXLINE, stdin);
	len = strlen(buff);
	if (buff[len-1] == '\n')
	{
		len--;
	}
	// write pathname to ipc channel
	//// 实验两次写完
	//if (write(writefd, buff, 2) < 0)
	//{
	//	perror("write to pipe:");
	//	exit(EXIT_FAILURE);
	//}
	//sleep(1);
	//if (write(writefd, buff + 2, len - 2) < 0)
	//{
	//	perror("write to pipe:");
	//	exit(EXIT_FAILURE);
	//}
	if (write(writefd, buff, len) < 0)
	{
		perror("write to pipe:");
		exit(EXIT_FAILURE);
	}
	// read from ipc , write to standard output
	while (1)
	{
		n = read(readfd, buff, MAXLINE);
		if (n == 0)
		{
			break;
		}
		else if(n > 0) 
		{
			if (write(STDOUT_FILENO, buff, n) < 0)
			{
				perror("write to stdout:");
				exit(EXIT_FAILURE);
			}
		}
		else
		{
			perror("read from pipe:");
			exit(EXIT_FAILURE);
		}
	}
}

void server(int readfd, int writefd)
{
	int fd;
	ssize_t n;
	char buff[MAXLINE + 1];

	n = read(readfd, buff, MAXLINE);
	if (n == 0)
	{
		perror("end of file while reading pathname");
	}
	else if(n > 0) 
	{
		buff[n] = '\0';
	}
	else
	{
		perror("read from pipe:");
		exit(EXIT_FAILURE);
	}
	if ((fd = open(buff, O_RDONLY)) < 0)
	{
		fprintf(stderr, "buff=%s\n", buff);
		snprintf(buff + n, sizeof(buff) - n, "can't open , %s\n", strerror(errno));
		n = strlen(buff);
		if (write(writefd, buff, n) < 0)
		{
			perror("write to pipe:");
			exit(EXIT_FAILURE);
		}

	}
	else
	{
		while (1)
		{
			n = read(fd, buff, MAXLINE);
			if (n == 0)
			{
				break;
			}
			else if(n > 0) 
			{
				if (write(writefd, buff, n) < 0)
				{
					perror("write to stdout:");
					exit(EXIT_FAILURE);
				}
			}
			else
			{
				perror("read from pipe:");
				exit(EXIT_FAILURE);
			}
		}
		close(fd);
	}

}
