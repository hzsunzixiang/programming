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




#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define MAX_EVENTS 10
	static int
create_and_bind (char *port);
	static int
make_socket_non_blocking (int sfd);
int main (int argc, char *argv[])
{
	struct epoll_event event;
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

	event.data.fd = sfd;
	event.events = EPOLLIN | EPOLLET;
	s = epoll_ctl (efd, EPOLL_CTL_ADD, sfd, &event);
	if (s == -1)
	{
		err_sys("epoll_ctl");
		exit(-1);
	}

	pause();

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
