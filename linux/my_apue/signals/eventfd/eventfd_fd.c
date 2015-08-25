#include <sys/eventfd.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>             /* Definition of uint64_t */

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{
	int efd;

	efd = eventfd(0, 0);
	if (efd == -1)
		handle_error("eventfd");
	pause();
	return 0;

}

//A copy of the file descriptor created by eventfd() is inherited by the child  produced  by  fork(2).   The  duplicate  file
//descriptor  is  associated  with  the  same  eventfd  object.   File  descriptors created by eventfd() are preserved across
//execve(2), unless the close-on-exec flag has been set.
