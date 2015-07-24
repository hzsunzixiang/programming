#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */


#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{

	if (argc != 2)
	{
		fprintf(stderr, "usage: %s <name>", argv[0]);
		exit(1);
	}

	int ret  = shm_unlink(argv[1]);
	if (ret < 0)
	{
		handle_error("shm_unlink:");
	}


	exit(EXIT_SUCCESS);
}
