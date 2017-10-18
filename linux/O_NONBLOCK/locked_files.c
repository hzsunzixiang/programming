#include <fcntl.h>
#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#define LOCKFILE "./flock_test.lock"
#define LOCKMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)

// 演示O_NONBLOCK 对 pseudo-files locked files 的作用
// O_NONBLOCK 对于 locked file 是有效的

void getlock2(fd)
{
    //if (flock(fd, LOCK_EX | LOCK_NB) < 0)
    if (flock(fd, LOCK_EX) < 0)
    {
        if (errno == EWOULDBLOCK)
        {
            printf("flock [%d]file already locked by other process fd : %d.\n", getpid(), fd);
			exit(1);
        }
        else
        {
            printf("flock [%d]locked file error fd:%d.\n", getpid(), fd);
            exit(1);
        }
    }
    else
    {   
        printf("flock [%d]get lock succ fd: %d.\n", getpid(), fd);
    }   
}

void unlock2(fd)
{
    if (flock(fd, LOCK_UN) < 0)
    {   
        printf("flock [%d]unlock error: %s fd: %d.\n", getpid(), strerror(errno), fd);
    }   
    else
    {   
        printf("flock [%d]unlock succ.fd: %d\n", getpid(), fd);
    }   
}
// http://lxr.oss.org.cn/source/Documentation/filesystems/locks.txt
// The solution I have chosen, after much experimentation and discussion,
// is to make flock() and fcntl() locks oblivious to each other. Both can
// exists, and neither will have any effect on the other.

// flock的操作结果与fcntl独立，不能混合使用flock和fcntl。


int main()
{
    int fd1;
    fd1 = open(LOCKFILE, O_RDWR | O_CREAT, LOCKMODE);
    if (fd1 < 0)
    {
        printf("can't open %s.\n", LOCKFILE);
        exit(1);
    }

    printf("parent pid: %d.\n", getpid());
	getlock2(fd1);
	printf("lock success\n");
	printf("press any key to unlock\n");
	getchar();
	unlock2(fd1);

	return 0;
}

