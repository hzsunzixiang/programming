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

/*
 *      If all file descriptors referring to the write end of a pipe have been closed, then an attempt to read(2) from the pipe will see end-of-file (read(2) will return 0) <所以**unpv2 习题4.1 讲的就是这个问题>.  If all file  descriptors  referring to the read end of a pipe have been closed, then a write(2) will cause a SIGPIPE signal to be generated for the calling process.  If the calling process is    ignoring this signal, then write(2) fails with the error EPIPE.  An application that uses pipe(2) and fork(2) should use suitable close(2) calls to  close  unnecessary  duplicate     file descriptors; this ensures that end-of-file and SIGPIPE/EPIPE are delivered when appropriate. 
 *
 * */

/*没有模拟出来SIGPIPE信号
 *
 * 收到如下错误 write pipe: Bad file descriptor
 *
 * */


void handle_pipe(int sig);
	int
main(int argc, char *argv[])
{
	// 安装信号
    struct sigaction action;
    action.sa_handler = handle_pipe;
    sigemptyset(&action.sa_mask);
    action.sa_flags = 0;
    sigaction(SIGPIPE, &action, NULL);



	int pipefd[2];
	pid_t cpid;
	char buf;

	if (argc != 2) {
		fprintf(stderr, "Usage: %s <string>\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	if (pipe(pipefd) == -1) {
		perror("pipe");
		exit(EXIT_FAILURE);
	}

	cpid = fork();
	if (cpid == -1) {
		perror("fork");
		exit(EXIT_FAILURE);
	}

	if (cpid == 0) {    /* Child reads from pipe */
		fprintf(stderr, "child......\n");
		// 子进程关闭写的一端
		close(pipefd[1]);          /* Close unused write end */

		while (read(pipefd[0], &buf, 1) > 0)
			write(STDOUT_FILENO, &buf, 1);

		//fprintf(stderr, "child after write......\n");
		write(STDOUT_FILENO, "\n", 1);
		fprintf(stderr, "child will close pipefd[0]......\n");
		close(pipefd[0]);
		_exit(EXIT_SUCCESS);

	} else {            /* Parent writes argv[1] to pipe */
		fprintf(stderr, "parent......\n");
		// 父进程关闭读的一端
		close(pipefd[0]);          /* Close unused read end */
		write(pipefd[1], argv[1], strlen(argv[1]));
		fprintf(stderr, "parent will close pipefd[1]......\n");
		sleep(1);
		close(pipefd[1]);          /* Reader will see EOF -----*/
		if (write(pipefd[1], argv[1], strlen(argv[1])) < 0)
		{
			perror("write error");
		}
		if (write(pipefd[1], argv[1], strlen(argv[1])) < 0)
		{
			perror("write error");
		}
		//sleep(10);
		wait(NULL);                /* Wait for child */
		exit(EXIT_SUCCESS);
	}
}

void handle_pipe(int sig)
{
    printf("receive pipe!\n");
}
