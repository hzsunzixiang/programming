#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define FILE_MODE  0666

struct shmstruct {	/* struct stored in shared memory */
  int	count;
};
sem_t	*mutex;		/* pointer to named semaphore */

int
main(int argc, char **argv)
{
	int		fd, i, nloop;
	pid_t	pid;
	struct shmstruct	*ptr;

	if (argc != 4)
		handle_error("usage: client1 <shmname> <semname> <#loops>");
	nloop = atoi(argv[3]);

	fd = shm_open(argv[1], O_RDWR, FILE_MODE);
	ptr = mmap(NULL, sizeof(struct shmstruct), PROT_READ | PROT_WRITE,
			   MAP_SHARED, fd, 0);
	close(fd);

	mutex = sem_open(argv[2], 0);

	pid = getpid();
	for (i = 0; i < nloop; i++) {
		sem_wait(mutex);
		printf("pid %ld: %d\n", (long) pid, ptr->count++);
		sem_post(mutex);
	}
	exit(0);
}
