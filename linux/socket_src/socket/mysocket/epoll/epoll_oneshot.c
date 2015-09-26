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
#include <malloc.h> 


#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define MAX_EVENTS 10
static int
make_socket_non_blocking (int sfd);
int main (int argc, char *argv[])
{
	struct epoll_event event, *events;
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
	//event.events = EPOLLIN | EPOLLET;
	event.events = EPOLLIN | EPOLLET | EPOLLONESHOT;
	s = epoll_ctl (efd, EPOLL_CTL_ADD, sfd, &event);
	if (s == -1)
	{
		err_sys("epoll_ctl");
		exit(1);
	}
	/* Buffer where events are returned */
	events = calloc (MAX_EVENTS, sizeof event);
	//events = (struct epoll_event *)calloc (MAX_EVENTS, sizeof event);
	/* The event loop */
	while (1)
	{
		int n, i;

		n = epoll_wait (efd, events, MAX_EVENTS, -1);
		for (i = 0; i < n; i++)
		{
			if ((events[i].events & EPOLLERR) ||
					(events[i].events & EPOLLHUP) ||
					(!(events[i].events & EPOLLIN)))
			{
				/* An error has occured on this fd, or the socket is not
				   ready for reading (why were we notified then?) */
				fprintf (stderr, "epoll error\n");
				close (events[i].data.fd);
				continue;
			}
			else
			{
				/* We have data on the fd waiting to be read. Read and
				   display it. We must read whatever data is available
				   completely, as we are running in edge-triggered mode
				   and won't get a notification again for the same
				   data. */
				while (1)
				{
					ssize_t count;
					char buf[2];

					count = read (events[i].data.fd, buf, sizeof buf);
					if (count == -1)
					{
						/* If errno == EAGAIN, that means we have read all
						   data. So go back to the main loop. */
						if (errno != EAGAIN)
						{
							err_sys("read");
						}
						break;
					}
					/* Write the buffer to standard output */
					s = write (1, buf, count);
					if (s == -1)
					{
						perror ("write");
						abort ();
					}
				}

			}
		}
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
