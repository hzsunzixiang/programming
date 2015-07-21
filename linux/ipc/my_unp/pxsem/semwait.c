

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <time.h>
#include <assert.h>
#include <errno.h>
#include <signal.h>
#include <fcntl.h>  // ‘O_EXCL’ undeclared (first use in this function)



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)




int main(int argc, char **argv)
{
	sem_t *sem;
	int val;
	if (argc != 2)
	{
		fprintf(stderr, "usage: semunlink <name>\n");
	}
	sem = sem_open(argv[1], 0);
	if (sem == SEM_FAILED)
	{
		handle_error("sem_open:");
	}
	if (sem_wait(sem))
	{
		handle_error("sem_wait");
	}
	if (sem_getvalue(sem, &val))
	{
		handle_error("sem_getvalue");
	}

	printf("pid %ld has semaphore, value = %d\n",  (long)getpid(), val);
	return EXIT_SUCCESS;
}
