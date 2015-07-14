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
