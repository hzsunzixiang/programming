
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
	if (argc != 2)
	{
		fprintf(stderr, "usage: semunlink <name>\n");
	}
	if (sem_unlink(argv[1]) == -1)
	{
		handle_error("sem_unlink");
	}
	return EXIT_SUCCESS;
}
