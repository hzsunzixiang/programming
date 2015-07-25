#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/shm.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <sys/types.h> // ftok
#include <sys/ipc.h>  // ftok



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{
	int c, id, flags ;
	char *ptr;
	off_t length;

	flags = IPC_CREAT | 0666; // 
	// 两个标志必须同时加，不然要么创建不成功，要么没权限shmat
	//------ Shared Memory Segments --------
	//key        shmid      owner      perms      bytes      nattch     status
	//
	// 0x0002d297 1835013    p_jdzxsun  0          1234       0
	while ( (c = getopt(argc, argv, "e")) != -1) {
		switch (c) {
			case 'e':
				flags |= O_EXCL;
				break;
		}
	}
	if (optind != argc - 2)
	{
		fprintf(stderr, "usage: %s [ -e ] <name> <length>", argv[0]);
		exit(1);
	}

	length = atoi(argv[optind + 1]);

	int ftok_ret = ftok(argv[optind], 0x0);
	if(ftok_ret < 0)
	{
		handle_error("ftok \n");
	}
	printf("file %s, ftok = %x \n", argv[optind], ftok_ret);
	// open file , initialize to 0, map into memory
	id = shmget(ftok_ret, length, flags);
	if (id < 0)
	{
		handle_error("shm_get :");
	}
	ptr = shmat(id, NULL, 0);
	if (ptr == (void *)-1)
	{
		handle_error("shmat:");
	}

	close(id);


	exit(EXIT_SUCCESS);
}
