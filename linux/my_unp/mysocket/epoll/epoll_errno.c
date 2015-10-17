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

	//efd = epoll_create1 (0);
	//
	//epoll_create: Invalid argument
	//efd = epoll_create (-1);



	// epoll_create: Invalid argument
	//
	// efd = epoll_create1 (11);
	
	efd = epoll_create1 (0);
	if (efd == -1)
	{
		err_sys("epoll_create");
		exit(1);
	}

	event.data.fd = sfd;
	event.events = EPOLLIN | EPOLLET;
	s = epoll_ctl (efd, EPOLL_CTL_ADD, sfd, &event);
	if (s == -1)
	{
		err_sys("epoll_ctl");
		exit(1);
	}
	// 如果再 加入一次就会报如下错误：epoll_ctl: File exists
	// EEXIST op was EPOLL_CTL_ADD, and the supplied file descriptor fd is already registered with this epoll instance.
	//
    // Q1  What happens if you register the same file descriptor on an epoll instance twice?
    // A1  You  will  probably  get  EEXIST.  However, it is possible to add a duplicate (dup(2), dup2(2), fcntl(2) F_DUPFD) descriptor to the same epoll instance.  This can be a useful
    // technique for filtering events, if the duplicate file descriptors are registered with different events masks.

	// s = epoll_ctl (efd, EPOLL_CTL_ADD, sfd, &event);
	// if (s == -1)
	// {
	// 	err_sys("epoll_ctl");
	// 	exit(1);
	// }



	//  EINVAL epfd is not an epoll file descriptor, or fd is the same as epfd, or the requested operation op is not supported by this interface.
	//
	// Q4  What happens if one attempts to put an epoll file descriptor into its own file descriptor set?
	// A4  The epoll_ctl(2) call will fail (EINVAL).  However, you can add an epoll file descriptor inside another epoll file descriptor set.
	// epoll_ctl: Invalid argument
	//
	// event.data.fd = efd;
	// event.events = EPOLLIN | EPOLLET;
	// s = epoll_ctl (efd, EPOLL_CTL_ADD, efd, &event);
	// if (s == -1)
	// {
	// 	err_sys("epoll_ctl");
	// 	exit(1);
	// }

	// EBADF  epfd or fd is not a valid file descriptor.
	// epoll_ctl: Bad file descriptor
	//event.data.fd = 100;
	//event.events = EPOLLIN | EPOLLET;
	//s = epoll_ctl (efd, EPOLL_CTL_ADD, 100, &event);
	//if (s == -1)
	//{
	//	err_sys("epoll_ctl");
	//	exit(1);
	//}

	// ENOENT op was EPOLL_CTL_MOD or EPOLL_CTL_DEL, and fd is not registered with this epoll instance.
	
	//epoll_ctl: No such file or directory
	//先检查描述符是否存在，如果不存在报错  epoll_ctl: Bad file descriptor
	//描述复存在，但是没有注册， epoll_ctl: No such file or directory
	//event.data.fd = 1;
	//event.events = EPOLLIN | EPOLLET;
	//s = epoll_ctl (efd, EPOLL_CTL_DEL, 1, &event);
	//if (s == -1)
	//{
	//	err_sys("epoll_ctl");
	//	exit(1);
	//}



	/* Buffer where events are returned */
	events = calloc (MAX_EVENTS, sizeof event);
	//events = (struct epoll_event *)calloc (MAX_EVENTS, sizeof event);
	/* The event loop */
	while (1)
	{
		int n, i;

		//n = epoll_wait (efd, events, MAX_EVENTS, -1);
		n = epoll_wait (100, events, MAX_EVENTS, -1);
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
