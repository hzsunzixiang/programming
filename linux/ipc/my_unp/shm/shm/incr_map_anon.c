#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

struct shared
{
	sem_t mutex;
	int count;
}shared;

	int
main(int argc, char *argv[])
{
	int  i, nloop;
	struct shared *ptr;

	if (argc != 2)
	{
		fprintf(stderr, "usage: incr_map_anon  <#loops>\n");
		exit(EXIT_FAILURE);
	}

	nloop = atoi(argv[1]);

	//  map into memory
	ptr = mmap(NULL, sizeof(struct shared), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
	if (ptr == MAP_FAILED)
	{
		handle_error("mmap:");
	}
	// initialize semphore that is shared between processes
	//
	if (sem_init(&ptr->mutex, 1, 1) < 0)
	{
		handle_error("sem_init:");
	}

	setbuf(stdout, NULL);

	pid_t pid = fork();
	if (pid == 0)
	{
		for(i = 0; i < nloop; i++)
		{
			sem_wait(&ptr->mutex);
			printf("child: %d\n", ptr->count++);
			sem_post(&ptr->mutex);
		}
		exit(0);

	}
	for(i = 0; i < nloop; i++)
	{
		sem_wait(&ptr->mutex);
		printf("parent: %d\n", ptr->count++);
		sem_post(&ptr->mutex);
	}

	exit(EXIT_SUCCESS);
}
