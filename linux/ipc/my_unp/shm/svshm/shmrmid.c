#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <sys/ipc.h>
#include <sys/shm.h>

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{

	int id;
	if (argc != 2)
	{
		fprintf(stderr, "usage: %s <name>", argv[0]);
		exit(1);
	}

	int ftok_ret = ftok(argv[optind], 0x0);
	if(ftok_ret < 0)
	{
		handle_error("ftok");
	}
	printf("ftok = %x\n", ftok_ret);
	// open file , get szie , map 
	id = shmget(ftok_ret, 0, 0666);
	if (id < 0)
	{
		handle_error("shm_open :");
	}

	int ret = shmctl(id, IPC_RMID, NULL);;
	if (ret == -1)
	{
		handle_error("shmctl:");
	}
	else
	{
		printf("remove %x success\n", ftok_ret);
	}

	exit(EXIT_SUCCESS);
}
