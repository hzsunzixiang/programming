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


int setlock(int fd, int type)
{
    struct flock fl;
    fl.l_type = type;
    fl.l_start = 0;
    fl.l_whence = SEEK_SET;
    fl.l_len = 0;
    return(fcntl(fd, F_SETLK, &fl));
}

void testlock(int fd)
{
    struct flock fl;
    fl.l_type = F_WRLCK;
    fl.l_start = 0;
    fl.l_whence = SEEK_SET;
    fl.l_len = 0;

    if (fcntl(fd, F_GETLK, &fl) < 0)
    {
        printf("[%d]fcntl error, fd: %d.\n", getpid(), fd);
        exit(1);
    }

    if (fl.l_type == F_UNLCK)
        printf("fcntl: [%d]file unlocked fd: %d. \n", getpid(), fd);
    else
        printf("fcntl: [%d]file locked by pid: %d, fd:%d.\n", getpid(), fl.l_pid, fd);
}

void getlock(fd)
{
    if (setlock(fd, F_WRLCK) < 0)
    {
        if (errno == EACCES || errno == EAGAIN)
        {
            printf("fcntl :[%d]file already locked by other process, fd:%d.\n", getpid(), fd);
        }
        else
        {
            printf("fcntl [%d]locked file error, fd:%d.\n", getpid(), fd);
            exit(1);
        }
    }
    else
    {
        printf("fcntl [%d]get lock succ %d.\n", getpid(), fd);
    }
}

void unlock(fd)
{
    if (setlock(fd, F_UNLCK) < 0)
    {
        printf("fcntl [%d]unlock error: %s, fd:%d.\n", getpid(), strerror(errno), fd);
    }
    else
    {
        printf("fcntl [%d]unlock succ. fd:%d\n", getpid(), fd);
    }
}

void getlock2(fd)
{
    if (flock(fd, LOCK_EX | LOCK_NB) < 0)
    {
        if (errno == EWOULDBLOCK)
        {
            printf("flock [%d]file already locked by other process fd : %d.\n", getpid(), fd);
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
    if (flock(fd, LOCK_UN | LOCK_NB) < 0)
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
    int fd1, fd2;
    pid_t pid;

    fd1 = open(LOCKFILE, O_RDWR | O_CREAT, LOCKMODE);
    if (fd1 < 0)
    {
        printf("can't open %s.\n", LOCKFILE);
        exit(1);
    }

    printf("parent pid: %d.\n", getpid());
    getlock2(fd1);
    getlock(fd1);
    if ((pid = fork()) < 0)
    {   
        printf("fork error.\n");
        exit(1);
    }   
    else if (pid == 0)
    {   
        printf("child pid: %d.\n", getpid());
        fd2 = open(LOCKFILE, O_RDWR | O_CREAT, LOCKMODE);
        if (fd2 < 0)
        {
            printf("can't open %s.\n", LOCKFILE);
            exit(1);
        }
        testlock(fd1);
        getlock(fd2);
        getlock2(fd1);
        getlock2(fd2);
    }   
    else
    {   
        while(1)
            sleep(10);
    }   

    return 0;
}

//  p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ ./flock_fcntl
//  parent pid: 4563.
//  flock [4563]get lock succ fd: 3.
//  fcntl [4563]get lock succ 3.
//  child pid: 4564.
//  fcntl: [4564]file locked by pid: 4563, fd:3.
//  fcntl :[4564]file already locked by other process, fd:4.
//  flock [4564]get lock succ fd: 3.

