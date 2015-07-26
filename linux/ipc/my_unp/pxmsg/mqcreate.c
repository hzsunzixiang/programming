#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/shm.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <mqueue.h> 
#include <sys/ipc.h>  // ftok



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{
	int c,  flags ;
	mqd_t mqd;

	flags = O_RDWR | O_CREAT; // 
	while ( (c = getopt(argc, argv, "e")) != -1) {
		switch (c) {
			case 'e':
				flags |= O_EXCL;
				break;
		}
	}
	if (optind != argc - 1)
	{
		fprintf(stderr, "usage: %s [ -e ] <name> ", argv[0]);
		exit(1);
	}

	mqd = mq_open(argv[optind], flags, 0666, NULL);
	if (mqd < 0)
	{
		handle_error("mq_open");
	}

	int ret = mq_close(mqd);
	if (ret < 0)
	{
		handle_error("mq_close");
	}

	exit(EXIT_SUCCESS);
}
