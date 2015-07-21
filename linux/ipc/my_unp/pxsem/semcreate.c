
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <time.h>
#include <assert.h>
#include <errno.h>
#include <signal.h>
#include <fcntl.h>  // ‘O_EXCL’ undeclared (first use in this function)

//If define name as "/tmp/xxxx", and invoke sem_open(name, flag...), sem_open will failed with "No such file or directory". 
//
//Looked into the code sem_open.c, the reason is that the name ("/tmp/xxxx")will map to /dev/shm/sem.tmp/xxxx, but sem.tmp directory is not there, so there will be an error.
//
//I think in sem_open.c, it maybe needs a check of whether name has more slash characters other than the leading slash character.
//If it has, mkdir the related directory before rename operation (sem_open.c:234), such as the following:
//tmpname = strrchr(finalname, '/');  // get the file name without directory
//strncpy(pathname, finalname, strlen(finalname) - strlen(tmpname)); // get the directory path
//mkdir(pathname, 0777)
//
//	To the POSIX std, it says the interpretation of slash characters other than the leading slash character in name is implementaion defined. I think it will be more friendly to allow the user using a name with directory.
//
//

#define handle_error(msg) \
		do { perror(msg); exit(EXIT_FAILURE); } while (0)




int main(int argc, char **argv)
{
	int		c, flags;
	sem_t	*sem;
	unsigned int	value = 1;

	flags = O_RDWR | O_CREAT;
	value = 1;
	while ( (c = getopt(argc, argv, "ei:")) != -1) {
		switch (c) {
		case 'e':
			flags |= O_EXCL;
			break;

		case 'i':
			value = atoi(optarg);
			break;
		}
	}
	if (optind != argc - 1)
	{
		fprintf(stderr, "usage: semcreate [ -e ] [ -i initalvalue ] <name>");
		exit(1);
	}

	//printf("the file name %s\n", argv[optind]);
	printf("the file name %s\n", argv[1]);
	//sem = sem_open(argv[optind], flags, 0666, value);
	sem = sem_open(argv[1], flags, 0666, value);
	if (sem == SEM_FAILED)
	{
		handle_error("sem_open:");
	}

	if (sem_close(sem) == -1)
		handle_error("sem_close");

	return 0;
}
