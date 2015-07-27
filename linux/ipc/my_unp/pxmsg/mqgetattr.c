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
	mqd_t mqd;
	struct mq_attr attr;

	if (argc != 2)
	{
		fprintf(stderr, "usage: %s  <name> ", argv[0]);
		exit(1);
	}

	mqd = mq_open(argv[1], O_RDONLY);
	if (mqd < 0)
	{
		handle_error("mq_open");
	}

	int ret = mq_getattr(mqd, &attr);
	if (ret < 0)
	{
		handle_error("mq_getattr");
	}
	printf("max #msgs = %ld, max #bytes/msg = %ld, #currently on queue = %ld\n", 
			attr.mq_maxmsg, attr.mq_msgsize, attr.mq_curmsgs);
	ret = mq_close(mqd);
	if (ret < 0)
	{
		handle_error("mq_close");
	}

	exit(EXIT_SUCCESS);
}
