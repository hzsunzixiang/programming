#include <sys/file.h>  // int flock(int fd, int operation);
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <sys/stat.h>

#define LOCKFILE "./flock_test.lock"
#define LOCKMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)

// man flock
// flock - apply or remove an advisory lock on an open file
//
//   If  a process uses open(2) (or similar) to obtain more than one descriptor for the same file, these descriptors are treated independently by flock().  An attempt to lock the file
//   using one of these file descriptors may be denied by a lock that the calling process has already placed via another descriptor.
//
void getlock(fd)
{
	if (flock(fd, LOCK_EX | LOCK_NB) < 0)
	{
		if (errno == EWOULDBLOCK)
		{
			printf("[%d]file already locked by other process.fd :%d\n", getpid(), fd);
		}
		else
		{
			printf("[%d]locked file error. fd:%d\n", getpid(), fd);
			exit(1);
		}
	}
	else
	{
		printf("[%d]get lock succ.fd :%d\n", getpid(), fd);
	}
}

void unlock(fd)
{
	if (flock(fd, LOCK_UN | LOCK_NB) < 0)
	{
		printf("[%d]unlock error: %s. fd: %d\n", getpid(), strerror(errno), fd);
	}
	else
	{
		printf("[%d]unlock succ. fd: %d\n", getpid(), fd);
	}
}

int main()
{
	int fd1, fd2;
	//pid_t pid;

	fd1 = open(LOCKFILE, O_RDWR | O_CREAT, LOCKMODE);
	if (fd1 < 0)
	{
		printf("can't open %s.\n", LOCKFILE);
		exit(1);
	}

	fd2 = open(LOCKFILE, O_RDWR | O_CREAT, LOCKMODE);
	if (fd2 < 0)
	{
		printf("can't open %s.\n", LOCKFILE);
		exit(1);
	}

	printf("parent pid: %d.fd1: %d, fd2: %d\n", getpid(), fd1, fd2);
	getlock(fd1);
	getlock(fd2);
	getlock(fd1);
	getlock(fd2);

	return 0;
}
