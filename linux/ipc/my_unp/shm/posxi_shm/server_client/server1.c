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
	int		fd;
	struct shmstruct	*ptr;

	if (argc != 3)
		handle_error("usage: server1 <shmname> <semname>");

	shm_unlink(argv[1]);		/* OK if this fails */
		/* 4create shm, set its size, map it, close descriptor */
	fd = shm_open(argv[1], O_RDWR | O_CREAT | O_EXCL, FILE_MODE);
	ftruncate(fd, sizeof(struct shmstruct));
	ptr = mmap(NULL, sizeof(struct shmstruct), PROT_READ | PROT_WRITE,
			   MAP_SHARED, fd, 0);
	close(fd);

	sem_unlink(argv[2]);		/* OK if this fails */
	mutex = sem_open(argv[2], O_CREAT | O_EXCL, FILE_MODE, 1);
	sem_close(mutex);

	exit(0);
}
