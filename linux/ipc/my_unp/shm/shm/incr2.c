#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{
	int fd, i, nloop, zero = 0;
	int *ptr;
	sem_t *mutex;

	if (argc != 3)
	{
		fprintf(stderr, "usage: incr2 <pathname> <#loops>\n");
		exit(EXIT_FAILURE);
	}

	nloop = atoi(argv[2]);

	// open file , initialize to 0, map into memory
	fd = open(argv[1], O_RDWR | O_CREAT, 0666);
	if (fd < 0)
	{
		handle_error("open file:");
	}
	if (write(fd, &zero, sizeof(int)) < 0)
	{
		handle_error("write to file");
	}
	ptr = mmap(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (ptr == MAP_FAILED)
	{
		handle_error("mmap:");
	}

	close(fd);

	// create, initialize, and unlink semaphore
	//
	mutex = sem_open("test", O_CREAT | O_EXCL, 0666, 1);
	sem_unlink("test");


	setbuf(stdout, NULL);

	pid_t pid = fork();
	if (pid == 0)
	{
		for(i = 0; i < nloop; i++)
		{
			sem_wait(mutex);
			printf("child: %d\n", (*ptr)++);
			sem_post(mutex);
		}
		exit(0);

	}
	for(i = 0; i < nloop; i++)
	{
		sem_wait(mutex);
		printf("parent: %d\n", (*ptr)++);
		sem_post(mutex);
	}

	pause();
	exit(EXIT_SUCCESS);
}
