#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<fcntl.h>

#define MAXLINE 4096
#define SERV_FIFO       "/tmp/fifo.serv"
	int
main(int argc, char *argv[])
{
	int readfifo, writefifo;
	char *ptr, buff[MAXLINE + 1], fifoname[MAXLINE];
	pid_t pid;
	ssize_t n;
	size_t len;

	// create  FIFO with our PID as part of name
	pid = getpid();
	snprintf(fifoname, sizeof(fifoname), "/tmp/fifo.%ld", (long)pid);
	printf("fifoname:%s\n", fifoname);
	if ((mkfifo(fifoname, 0666) < 0) && (errno != EEXIST))
	{
		perror("mkfifo error");
		exit(EXIT_FAILURE);
	}

	// start buff with pid and a blank
	snprintf(buff, sizeof(buff), "%ld ", (long)pid);
	len = strlen(buff);
	ptr = buff + len;
	fgets(ptr, MAXLINE-len, stdin);
	len = strlen(buff);

	//open fifo to server and write PID and pathname to FIFO
	// 服务器的open函数调用 open(SERV_FIFO, O_RDONLY, 0);
	// 将阻塞到第一个客户只写打开服务器的FIFO为止
	//getchar();
	// 同样，服务器在打开FIFO读之前这里也阻塞
	writefifo = open(SERV_FIFO, O_WRONLY, 0);
	printf("open fifo :%s return\n",SERV_FIFO);
	//getchar();

	printf("buff sent to server:%s  data:%s\n",SERV_FIFO, buff);
	if ( (write(writefifo, buff, len)) < 0)
	{
		perror("write to fifo");
		close(writefifo);
	}

	// now open our FIFO; blocks until server opens for writing
	// 服务器端的 写FIFO 阻塞直到 ( (writefifo = open(fifoname, O_WRONLY, 0)) < 0)
	// 所以恶意客户给他发送一个命令行，但从来不代开自己的FIFO来读，所以服务器端会一直阻塞，而不能服务下一个客户
	//getchar(); // 打开这一行，可以模拟Dos攻击 ,在这里停下，导致其他客户端无法响应请求
	readfifo = open(fifoname, O_RDONLY, 0);
	//getchar();
	printf("read from fifoname :%s\n", fifoname);
	while(1){
		n = read(readfifo, buff, MAXLINE);
		if (n < 0)
		{
			perror("read  server pipe error");
			return EXIT_FAILURE;
		}
		else if(n ==0)
		{
			break;
		}
		printf("read from fifoname :%s, n = %ld\n", fifoname, n);
		if ( (write(STDOUT_FILENO, buff, n)) < 0)
		{
			perror("write to fifo");
			close(writefifo);
		}
	}
	close(readfifo);
	unlink(fifoname);
	exit(EXIT_SUCCESS);
}



