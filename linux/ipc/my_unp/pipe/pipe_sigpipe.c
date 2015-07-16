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
  要模拟这种情形，需要使用select
 *
 见习题4.9
如果向一个没有为读打开着的管道或FIFO写入，那么内核将产生一个SIGPIPE信号
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
	fd_set wset;

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
		fprintf(stderr, "child closing pipe read descriptor......\n");
		// 子进程关闭读的一端
		close(pipefd[0]);          /* Close read end */

		sleep(6);
		_exit(EXIT_SUCCESS);

	} 
	/* Parent writes argv[1] to pipe */
	fprintf(stderr, "parent......\n");
	// 父进程关闭读的一端
	close(pipefd[0]);          /* Close unused read end */
	sleep(3);
	FD_ZERO(&wset);
	FD_SET(pipefd[1], &wset);
		

	int n = select(pipefd[1] + 1 , NULL, &wset, NULL, NULL);
	printf("select returned%d\n", n);
	if (FD_ISSET(pipefd[1], &wset))
	{
		// 第一次产生 sigpipe 信号
		if (write(pipefd[1], "hello", 5) < 0)
		{
			printf("fd[1] writable\n");
			perror("write error");
		}
		// If the calling process is    ignoring this signal, then write(2) fails with the error EPIPE. 
		// 仍然产生sigpipe
		// 不过错误信息依然是 write error: Broken pipe

		// 对于网络编程，当一个进程向某个已收到RST的套接口执行写操作时，内核向该进程发送一个SIGPIPE信号
		// 第一次引发RST，第二次写操作引发SIGPIPE信号。
		// 写一个已接受了FIN的套接口不成问题，写一个已接受RST的套接口则是一个错误
		if (write(pipefd[1], "hello", 5) < 0)
		{
			printf("fd[1] writable\n");
			perror("write error");
		}
	}
	wait(NULL);                /* Wait for child */
	exit(EXIT_SUCCESS);
}

void handle_pipe(int sig)
{
	printf("receive pipe signal...........!\n");
}
