/* $begin sharing */
#include <pthread.h> 
#include <stdio.h> 
#include <stdlib.h> 
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/epoll.h>
#include <string.h>   // memset
#include <errno.h> 




#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define MAX_EVENTS 10
	static int
make_socket_non_blocking (int sfd);
int main (int argc, char *argv[])
{
	struct epoll_event event;
	int sfd, s;
	int efd;

	struct stat st;
	char *fifo = "event.fifo";

	if (lstat (fifo, &st) == 0) {
		if ((st.st_mode & S_IFMT) == S_IFREG) {
			errno = EEXIST;
			err_sys("lstat");
			exit (1);
		}
	}

	unlink (fifo);
	if (mkfifo (fifo, 0600) == -1) {
		err_sys("mkfifo");
		exit (1);
	}

	/* Linux pipes are broken, we need O_RDWR instead of O_RDONLY */
	sfd = open (fifo, O_RDWR | O_NONBLOCK, 0);

	if (sfd == -1) {
		err_sys("open");
		exit (1);
	}

	s = make_socket_non_blocking (sfd);
	if (s == -1)
	{
		err_sys("socket error");
		exit(1);
	}

	efd = epoll_create1 (0);
	if (efd == -1)
	{
		err_sys("epoll_create");
		exit(1);
	}

	event.data.fd = sfd;
	event.events = EPOLLIN | EPOLLET;
	printf("%u\n", EPOLLIN | EPOLLET);
	s = epoll_ctl (efd, EPOLL_CTL_ADD, sfd, &event);
	if (s == -1)
	{
		err_sys("epoll_ctl");
		exit(1);
	}

	pause();

	return 0;
}

	static int
make_socket_non_blocking (int sfd)
{
	int flags, s;

	flags = fcntl (sfd, F_GETFL, 0);
	if (flags == -1)
	{
		perror ("fcntl");
		return -1;
	}

	flags |= O_NONBLOCK;
	s = fcntl (sfd, F_SETFL, flags);
	if (s == -1)
	{
		perror ("fcntl");
		return -1;
	}

	return 0;
}
