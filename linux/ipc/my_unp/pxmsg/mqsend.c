#include <stdio.h>
#include <stdint.h>
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


struct mq_attr attr; // mq_maxmsg AND mq_msgsize both init to 0
	int
main(int argc, char *argv[])
{
	mqd_t mqd;
	void *ptr;
	size_t len = 0;
	unsigned prio = 0;

	if (argc != 4)
	{
		fprintf(stderr, "usage: %s  <name> <#bytes> <priority> \n", argv[0]);
		exit(1);
	}

	len = atoi(argv[2]);
	prio = atoi(argv[3]);
	mqd = mq_open(argv[1], O_WRONLY);
	if (mqd < 0)
	{
		handle_error("mq_open");
	}

	ptr = calloc(len, sizeof(char));
	if (ptr == NULL)
	{
		handle_error("calloc");
	}

	int ret = mq_send(mqd, ptr, len, prio);
	if (ret < 0)
	{
		handle_error("mq_send");
	}

	exit(EXIT_SUCCESS);
}
