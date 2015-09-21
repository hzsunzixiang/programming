/* $begin sharing */
#include <pthread.h> 
#include <stdio.h> 
#include <stdlib.h> 
#include <unistd.h> 
#include <sys/epoll.h>


#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

int main()
{
#define MAX_EVENTS 10
	int epollfd;

	/* Set up listening socket, 'listen_sock' (socket(),
	   bind(), listen()) */

	epollfd = epoll_create1(0);
	if (epollfd == -1) {
		perror("epoll_create");
		exit(EXIT_FAILURE);
	}
	pause();


	return 0;
}
