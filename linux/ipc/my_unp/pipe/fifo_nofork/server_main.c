#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<fcntl.h>

//p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/pipe/fifo_nofork$ ./server_main &
//[3] 18991
//p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/pipe/fifo_nofork$ ./client_main
///tmp/test1
//hello,world
//[3]   Done                    ./server_main
//
#define FIFO1 "/tmp/fifo.1"
#define FIFO2 "/tmp/fifo.2"
/*
 * The  following program creates a pipe, and then fork(2)s to create a child process; the child inherits a duplicate set of file descriptors that refer to the same pipe.  After the
 * fork(2), each process closes the descriptors that it doesn't need for the pipe (see pipe(7)).  The parent then writes the string contained in the program's command-line  argument
 * to the pipe, and the child reads this string a byte at a time from the pipe and echoes it on standard output.
 *
 * */
void server(int readfd, int writefd);
	int
main(int argc, char *argv[])
{
	int readfd, writefd; 

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
	readfd = open(FIFO1, O_RDONLY, 0);
	writefd = open(FIFO2, O_WRONLY, 0);
	server(readfd, writefd);

	exit(EXIT_SUCCESS);
}



#define MAXLINE 4096
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
