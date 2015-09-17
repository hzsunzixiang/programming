/*
 * Compile with:
 * cc -I/usr/local/include -o event-test event-test.c -L/usr/local/lib -levent
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/queue.h>
#include <sys/time.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

#include "event.h"

void
fifo_read(int fd, short event, void *arg)
{
	char buf[255];
	int len;
	struct event *ev = arg;

	/* Reschedule this event */
	event_add(ev, NULL);

	fprintf(stderr, "fifo_read called with fd: %d, event: %d, arg: %p\n",
		fd, event, arg);

	// DOS攻击 转接到这里来了，
	// ----------server
    //   //如果使用readline函数，可能会遭受拒绝服务攻击
    //   //客户端只发送几个字节，不发送换行符，那么此时服务器不能响应其他客户端的服务
    //   if ((n = readline(sockfd, buf, MAXLINE)) < 0) // 收到RST 或其他
    //   //if ((n = read(sockfd, buf, MAXLINE)) < 0) // 收到RST 或其他

	// ----------client
	//	// 如果服务器期待接受一个换行符，而客户端迟迟不发送换行符，则服务器此时不能响应其他客户端的连接
    //    //if ((write(sockconn, "h", 1)) < 0)
    //    if ((write(sockconn, sendbuf, strlen(sendbuf))) < 0)
    //    {
    //        perror("write to socket error");
    //        exit(EXIT_FAILURE);
    //    }

	// 解决方式，通过非阻塞的方式
	len = read(fd, buf, sizeof(buf) - 1);
	if (len == -1) {
		perror("read");
		return;
	} else if (len == 0) {
		fprintf(stderr, "Connection closed\n");
		return;
	}
	// 
	sleep(60);

	buf[len] = '\0';
	fprintf(stdout, "Read: %s\n", buf);
	fprintf(stdout, "return from callback\n");
}

int
main (int argc, char **argv)
{
	struct stat st;
	char *fifo = "event.fifo";
	char *fifo1 = "event1.fifo";
	int socket;
	int socket1;
	struct event evfifo;
 
	if (lstat (fifo, &st) == 0) {
		if ((st.st_mode & S_IFMT) == S_IFREG) {
			errno = EEXIST;
			perror("lstat");
			exit (1);
		}
	}

	unlink (fifo);
	if (mkfifo (fifo, 0600) == -1) {
		perror("mkfifo");
		exit (1);
	}

	/* Linux pipes are broken, we need O_RDWR instead of O_RDONLY */
#ifdef __linux
	socket = open (fifo, O_RDWR | O_NONBLOCK, 0);
	socket1 = open (fifo1, O_RDWR | O_NONBLOCK, 0);
#else
	socket = open (fifo, O_RDONLY | O_NONBLOCK, 0);
	socket = open (fifo1, O_RDONLY | O_NONBLOCK, 0);
#endif

	if (socket == -1) {
		perror("open");
		exit (1);
	}

	fprintf(stderr, "Write data to %s\n", fifo);

	/* Initalize the event library */
	event_init();

	/* Initalize one event */
	event_set(&evfifo, socket, EV_READ, fifo_read, &evfifo);

	/* Add it to the active events, without a timeout */
	event_add(&evfifo, NULL);
	if (fork() == 0) // 子进程返回0
	{
		sleep(20);
		struct event evfifo1;
		event_set(&evfifo1, socket1, EV_READ, fifo_read, &evfifo1);
		event_add(&evfifo1, NULL);
		exit(0);
	}

	
	event_dispatch();

	return (0);
}

