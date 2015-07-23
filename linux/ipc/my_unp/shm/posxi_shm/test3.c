#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <sys/types.h>
#include <sys/wait.h>



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
	int
main(int argc, char **argv)
{
	int		fd1, fd2, *ptr1, *ptr2;
	pid_t	childpid;
	struct stat	stat;

	if (argc != 2)
		handle_error("usage: test3 <name>");

	shm_unlink(argv[1]);
	fd1 = shm_open(argv[1], O_RDWR | O_CREAT | O_EXCL, 0666);
	ftruncate(fd1, sizeof(int));
	fd2 = open("/etc/motd", O_RDONLY);
	fstat(fd2, &stat);

	if ( (childpid = fork()) == 0) {
		/* 4child */
		ptr2 = mmap(NULL, stat.st_size, PROT_READ, MAP_SHARED, fd2, 0);
		ptr1 = mmap(NULL, sizeof(int), PROT_READ | PROT_WRITE,
				MAP_SHARED, fd1, 0);
		printf("child: shm ptr = %p, motd ptr = %p\n", ptr1, ptr2);

		sleep(5);
		printf("shared memory integer = %d\n", *ptr1);
		exit(0);
	}
	/* 4parent: mmap in reverse order from child */
	ptr1 = mmap(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, fd1, 0);
	ptr2 = mmap(NULL, stat.st_size, PROT_READ, MAP_SHARED, fd2, 0);
	printf("parent: shm ptr = %p, motd ptr = %p\n", ptr1, ptr2);
	*ptr1 = 777;
	waitpid(childpid, NULL, 0);

	exit(0);
}
