#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>

//root@iZ25ox3a5vlZ:~/programming/linux/ipc/my_unp/shm/shm# od -b -A d foo
//0000000 001 000 000 000 000 000 000 000 000 000 000 000 000 000 000 000
//0000016 000 000 000 000 000 000 000 000 000 000 000 000 000 000 000 000
//*
//0004080 000 000 000 000 000 000 000 000 000 000 000 000 000 000 000 001
//0004096 001 000 000 000 000 000 000 000 000 000 000 000 000 000 000 000
//0004112 000 000 000 000 000 000 000 000 000 000 000 000 000 000 000 000
//*
//0004992 000 000 000 000 000 000 000 000
//0005000
//root@iZ25ox3a5vlZ:~/programming/linux/ipc/my_unp/shm/shm# od -l -A d foo
//0000000                    1                    0
//0000016                    0                    0
//*
//0004080                    0    72057594037927936
//0004096                    1                    0
//0004112                    0                    0
//*
//0004992                    0
//0005000

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define max( a, b ) ( ( a > b) ? a : b ) 
	int
main(int argc, char *argv[])
{
	int fd, i; 
	char *ptr;
	size_t filesize, mmapsize, pagesize;

	if (argc != 4)
	{
		fprintf(stderr, "usage: test1 <pahtname> <filesize> <mmapsize>\n");
		exit(EXIT_FAILURE);
	}

	filesize = atoi(argv[2]);
	mmapsize = atoi(argv[3]);

	// open file : create or truncate ; set file size 
	fd = open(argv[1], O_RDWR | O_CREAT |O_TRUNC, 0666);
	if (fd < 0)
	{
		handle_error("open file:");
	}
	lseek(fd, filesize - 1, SEEK_SET);
	write(fd, "", 1);
	ptr = mmap(NULL, mmapsize, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (ptr == MAP_FAILED)
	{
		handle_error("mmap:");
	}

	close(fd);

	pagesize = sysconf(_SC_PAGESIZE);
	printf("PAGESIZE = %ld\n", (long) pagesize);

	for (i = 0; i < max(filesize, mmapsize); i += pagesize)
	{
		printf("ptr[%d] = %d\n", i, ptr[i]);
		ptr[i] = 1;
		printf("ptr[%ld] = %d\n", i + pagesize - 1, ptr[i + pagesize -1]);
		ptr[i + pagesize - 1] = 1;
	}
	printf("ptr[%d] = %d\n", i, ptr[i]);
	//i = i + pagesize;
	//printf("ptr[%d] = %d\n", i, ptr[i]);
	//i = i + pagesize;
	//printf("ptr[%d] = %d\n", i, ptr[i]);
	exit(EXIT_SUCCESS);
}

