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
	int c, fd, flags ;
	char *ptr;
	off_t length;

	flags = O_RDWR | O_CREAT;
	while ( (c = getopt(argc, argv, "e")) != -1) {
		switch (c) {
			case 'e':
				flags |= O_EXCL;
				break;
		}
	}
	if (optind != argc - 2)
	{
		fprintf(stderr, "usage: %s [ -e ] <name> <length>", argv[0]);
		exit(1);
	}

	length = atoi(argv[optind + 1]);

	// open file , initialize to 0, map into memory
	fd = shm_open(argv[optind], flags, 0666);
	if (fd < 0)
	{
		handle_error("shm_open :");
	}
	int ret = ftruncate(fd, length);
	if (ret < 0)
	{
		handle_error("ftruncate:");
	}

	ptr = mmap(NULL, length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (ptr == MAP_FAILED)
	{
		handle_error("mmap:");
	}

	close(fd);


	exit(EXIT_SUCCESS);
}
