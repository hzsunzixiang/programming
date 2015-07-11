# include	<sys/ipc.h>		/* System V IPC */
#include	<sys/types.h>	/* basic system data types */
#include	<sys/time.h>	/* timeval{} for select() */
#include	<time.h>		/* timespec{} for pselect() */
#include	<errno.h>
#include	<fcntl.h>		/* for nonblocking */
#include	<limits.h>		/* PIPE_BUF */
#include	<signal.h>
#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>
#include	<sys/stat.h>	/* for S_xxx file mode constants */
#include	<unistd.h>
#include	<sys/wait.h>

int
main(int argc, char **argv)
{
	struct stat	stat1;
    // 这里限制 变量不能和结构体同名

	if (argc != 2)
    {
		perror("usage: ftok <pathname>");
        exit(1);
    }

	if (stat(argv[1], &stat1) < 0)
    {
		perror("stat");
        exit(1);
    }
	int ftok_ret = ftok(argv[1], 0x57);
    if(ftok_ret < 0)
    {
		perror("ftok");
    }
	printf("st_dev: %lx, st_ino: %lx, key: %x\n",
		   (u_long) stat1.st_dev, (u_long) stat1.st_ino,
		   ftok_ret);

	exit(0);
}
