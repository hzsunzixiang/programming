#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include<sys/types.h>
#include<sys/stat.h>
#include<errno.h>
#include<fcntl.h>

#define SERV_FIFO       "/tmp/fifo.serv"

#define MAXLINE 4096
ssize_t
readline(int fd, void *vptr, size_t maxlen);
	int
main(int argc, char *argv[])
{
	int readfifo, writefifo, dummyfd, fd; 
	char *ptr, buff[MAXLINE + 1], fifoname[MAXLINE];
	pid_t pid;
	ssize_t n;

	// create server's well-known FIFO; OK if they already exist
	//
	if ((mkfifo(SERV_FIFO, 0666) < 0) && (errno != EEXIST))
	{
		perror("mkfifo SERV_FIFO");
		exit(EXIT_FAILURE);
	}
	// open server's well-known FIFO for reading and writing 

	//getchar();
	// 客户端的写： FIFO 阻塞直到 服务器读
	readfifo = open(SERV_FIFO, O_RDONLY, 0);
	printf("open  %s for read  return\n", SERV_FIFO);

	writefifo = open(SERV_FIFO, O_WRONLY, 0);
	printf("open  %s for read and write \n", SERV_FIFO);
	while(1){
		n = readline(readfifo, buff, MAXLINE);
		if (n < 0)
		{
			perror("readline error");
			return EXIT_FAILURE;
		}
		else if(n ==0)
		{
			break;
		}
		if (buff[n-1] =='\n')
		{
			n--;
		}
		buff[n] = '\0';
		printf("read from client %s\n", buff);
		if ((ptr = strchr(buff, ' ')) ==NULL)
		{
			perror("bogus, request : ");
			continue;
		}
		*ptr++ = 0;
		pid = atol(buff);
		snprintf(fifoname, sizeof(fifoname), "/tmp/fifo.%ld", (long)pid);
		if ( (writefifo = open(fifoname, O_WRONLY, 0)) < 0)
		{
			perror("cannot open ");
			continue;
		}
		printf("open %s return\n", fifoname);
		if ( (fd = open(ptr, O_RDONLY)) < 0)
		{
			// error, mush tell client
			snprintf(buff + n, sizeof(buff) - n, ":cannot open ,%s\n", strerror(errno) );
			n = strlen(ptr);
			if ( (write(writefifo, ptr, n)) < 0)
			{
				perror("write to fifo");
				close(writefifo);
			}
		}
		else
		{
			// open succeeded : copy file to FIFO
			n = read(fd, buff, MAXLINE);
			if (n < 0)
			{
				perror("read file  error");
				return EXIT_FAILURE;
			}
			else if(n ==0)
			{
				break;
			}

			if ( (write(writefifo, buff, n)) < 0)
			{
				perror("write to fifo");
				close(writefifo);
			}

			close(fd);
			close(writefifo);
		}
	}
	exit(EXIT_SUCCESS);
}



	static ssize_t
my_read(int fd, char *ptr)
{
	static int	read_cnt = 0;
	static char	*read_ptr;
	static char	read_buf[MAXLINE];

	if (read_cnt <= 0) {
again:
		if ( (read_cnt = read(fd, read_buf, sizeof(read_buf))) < 0) {
			if (errno == EINTR)
				goto again;
			return(-1);
		} else if (read_cnt == 0)
			return(0);
		read_ptr = read_buf;
	}

	read_cnt--;
	*ptr = *read_ptr++;
	return(1);
}

	ssize_t
readline(int fd, void *vptr, size_t maxlen)
{
	int		n, rc;
	char	c, *ptr;

	ptr = vptr;
	for (n = 1; n < maxlen; n++) {
		if ( (rc = my_read(fd, &c)) == 1) {
			*ptr++ = c;
			if (c == '\n')
				break;	/* newline is stored, like fgets() */
		} else if (rc == 0) {
			if (n == 1)
				return(0);	/* EOF, no data read */
			else
				break;		/* EOF, some data was read */
		} else
			return(-1);		/* error, errno set by read() */
	}

	*ptr = 0;	/* null terminate like fgets() */
	return(n);
}
/* end readline */

