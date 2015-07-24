#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/shm.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <sys/types.h> // ftok
#include <sys/ipc.h>  // ftok



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{
	int c, id, flags ;
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

	int ftok_ret = ftok(argv[optind], 0x57);
	if(ftok_ret < 0)
	{
		handle_error("ftok");
	}
	printf("ftok = %d", ftok_ret);
	// open file , initialize to 0, map into memory
	id = shmget(ftok_ret, length, flags);
	if (id < 0)
	{
		handle_error("shm_open :");
	}
	ptr = shmat(id, NULL, 0);
	if (ptr == (void *)-1)
	{
		handle_error("mmap:");
	}

	close(id);


	exit(EXIT_SUCCESS);
}
