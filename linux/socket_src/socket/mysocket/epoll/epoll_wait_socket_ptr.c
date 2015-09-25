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
#include <errno.h>
#include <sys/epoll.h>
#include <string.h>   // memset


//  用指针，而不是用 文件描述符填充data域
struct event {
	int ev_fd;
	int padding;
};
struct epollop {
	struct event fds[10];
	struct epoll_event events[10];
	int epfd;
} epollop;


#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define MAXEVENTS 10
static int
create_and_bind (char *port);
static int
make_socket_non_blocking (int sfd);
int main (int argc, char *argv[])
{
	struct epoll_event event, *events;
	int sfd, s;
	int efd;

	/* Set up listening socket, 'listen_sock' (socket(),
	   bind(), listen()) */

	sfd = create_and_bind ("8888");
	if (sfd == -1)
		abort ();

	s = make_socket_non_blocking (sfd);
	if (s == -1)
	{
		err_sys("socket error");
		exit(1);
	}

	s = listen (sfd, SOMAXCONN);
	if (s == -1)
	{
		err_sys("listen");
		exit(-1);
	}

	efd = epoll_create1 (0);
	if (efd == -1)
	{
		err_sys("epoll_create");
		exit(-1);
	}

	// 填充 epollop 结构
	epollop.fds[sfd].ev_fd = sfd;  
	epollop.epfd = efd;
	struct event ev;
	ev = epollop.fds[sfd];  // NOTE: 以fd作为下标 的一个指针，指向数组, 

	event.data.ptr= &ev;
	event.events = EPOLLIN | EPOLLET;

	s = epoll_ctl (epollop.epfd, EPOLL_CTL_ADD, sfd, &event);
	if (s == -1)
	{
		err_sys("epoll_ctl");
		exit(-1);
	}

	/* Buffer where events are returned */
	events = calloc (MAXEVENTS, sizeof event);

	/* The event loop */
	while (1)
	{
		int n, i;

		n = epoll_wait (efd, events, MAXEVENTS, -1);
		for (i = 0; i < n; i++)
		{
			struct event *ev;
			ev = (struct event*)events[i].data.ptr;
			if ((events[i].events & EPOLLERR) ||
					(events[i].events & EPOLLHUP) ||
					(!(events[i].events & EPOLLIN)))
			{
				/* An error has occured on this fd, or the socket is not
				   ready for reading (why were we notified then?) */
				fprintf (stderr, "epoll error\n");
				close (ev->ev_fd);
				continue;
			}

			else if (sfd == ev->ev_fd)
			{
				/* We have a notification on the listening socket, which
				   means one or more incoming connections. */
				while (1)
				{
					struct sockaddr in_addr;
					socklen_t in_len;
					int infd;
					char hbuf[NI_MAXHOST], sbuf[NI_MAXSERV];

					in_len = sizeof in_addr;
					infd = accept (sfd, &in_addr, &in_len);
					if (infd == -1)
					{
						if ((errno == EAGAIN) ||
								(errno == EWOULDBLOCK))
						{
							/* We have processed all incoming
							   connections. */
							break;
						}
						else
						{
							perror ("accept");
							break;
						}
					}

					s = getnameinfo (&in_addr, in_len,
							hbuf, sizeof hbuf,
							sbuf, sizeof sbuf,
							NI_NUMERICHOST | NI_NUMERICSERV);
					if (s == 0)
					{
						printf("Accepted connection on descriptor %d "
								"(host=%s, port=%s)\n", infd, hbuf, sbuf);
					}

					/* Make the incoming socket non-blocking and add it to the
					   list of fds to monitor. */
					s = make_socket_non_blocking (infd);
					if (s == -1)
						abort ();

					// 填充 epollop 结构
					epollop.fds[sfd].ev_fd = infd;  
					epollop.epfd = efd;
					struct event ev;
					ev = epollop.fds[sfd];  // NOTE: 以fd作为下标 的一个指针，指向数组, 

					event.data.ptr= &ev;
					event.events = EPOLLIN | EPOLLET;

					s = epoll_ctl (efd, EPOLL_CTL_ADD, infd, &event);
					if (s == -1)
					{
						err_sys("epoll_ctl");
					}
				}
				continue;
			}
			else
			{
				/* We have data on the fd waiting to be read. Read and
				   display it. We must read whatever data is available
				   completely, as we are running in edge-triggered mode
				   and won't get a notification again for the same
				   data. */
				int done = 0;

				while (1)
				{
					ssize_t count;
					char buf[512];

					struct event *ev;
					ev = (struct event*)events[i].data.ptr;
					count = read (ev->ev_fd, buf, sizeof buf);
					if (count == -1)
					{
						/* If errno == EAGAIN, that means we have read all
						   data. So go back to the main loop. */
						if (errno != EAGAIN)
						{
							perror ("read");
							done = 1;
						}
						break;
					}
					else if (count == 0)
					{
						/* End of file. The remote has closed the
						   connection. */
						done = 1;
						break;
					}

					/* Write the buffer to standard output */
					s = write (1, buf, count);
					if (s == -1)
					{
						err_sys("write");
					}
				}

				if (done)
				{
					struct event *ev;
					ev = (struct event*)events[i].data.ptr;
					printf ("Closed connection on descriptor %d\n",
							ev->ev_fd);

					/* Closing the descriptor will make epoll remove it
					   from the set of descriptors which are monitored. */
					close (ev->ev_fd);
				}
			}
		}
	}

	return 0;
}


	static int
create_and_bind (char *port)
{
	struct addrinfo hints;
	struct addrinfo *result, *rp;
	int s, sfd;

	memset (&hints, 0, sizeof (struct addrinfo));
	hints.ai_family = AF_UNSPEC;     /* Return IPv4 and IPv6 choices */
	hints.ai_socktype = SOCK_STREAM; /* We want a TCP socket */
	hints.ai_flags = AI_PASSIVE;     /* All interfaces */

	s = getaddrinfo (NULL, port, &hints, &result);
	if (s != 0)
	{
		fprintf (stderr, "getaddrinfo: %s\n", gai_strerror (s));
		return -1;
	}

	for (rp = result; rp != NULL; rp = rp->ai_next)
	{
		sfd = socket (rp->ai_family, rp->ai_socktype, rp->ai_protocol);
		if (sfd == -1)
			continue;

		s = bind (sfd, rp->ai_addr, rp->ai_addrlen);
		if (s == 0)
		{
			/* We managed to bind successfully! */
			break;
		}

		close (sfd);
	}

	if (rp == NULL)
	{
		fprintf (stderr, "Could not bind\n");
		return -1;
	}

	freeaddrinfo (result);

	return sfd;
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
