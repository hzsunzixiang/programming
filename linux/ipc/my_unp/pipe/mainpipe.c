#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

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

	if (argc != 2) {
		fprintf(stderr, "Usage: %s <string>\n", argv[0]);
		exit(EXIT_FAILURE);
	}

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

	if (childpid== 0) {    /* Child reads from pipe */
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
	char * ret = fgets(buff, MAXLINE, stdin);
	len = strlen(buff);
	
}

void server(int readfd, int writefd)
{
}
