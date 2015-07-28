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
	ssize_t n;
	unsigned prio;
	void *buff;
	struct mq_attr attr;

	flags = O_RDONLY; // 
	while ( (c = getopt(argc, argv, "n")) != -1) {
		switch (c) {
			case 'n':
				flags |= O_NONBLOCK;
				break;
		}
	}
	if (optind != argc - 1)
	{
		fprintf(stderr, "usage: %s [ -e ] -n <name> \n", argv[0]);
		exit(1);
	}

	mqd = mq_open(argv[optind], flags);
	if (mqd < 0)
	{
		handle_error("mq_open");
	}

	int ret = mq_getattr(mqd, &attr);
	if (ret < 0)
	{
		handle_error("mq_getattr");
	}

	buff = malloc(attr.mq_msgsize);
	n = mq_receive(mqd, buff, attr.mq_msgsize, &prio);
	if (n < 0)
	{
		handle_error("mq_receive");
		exit(EXIT_FAILURE);
	}
	printf("read %ld bytes, priority = %u\n", (long)n, prio);

	exit(EXIT_SUCCESS);
}
