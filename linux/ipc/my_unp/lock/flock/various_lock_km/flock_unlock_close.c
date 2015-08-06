#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <sys/stat.h>

#define LOCKFILE "./flock_test.lock"
#define LOCKMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)

void getlock(fd)
{
    if (flock(fd, LOCK_EX | LOCK_NB) < 0)
    {
        if (errno == EWOULDBLOCK)
        {
            printf("[%d]file already locked by other process.\n", getpid());
        }
        else
        {
            printf("[%d]locked file error.\n", getpid());
            exit(1);
        }
    }
    else
    {
        printf("[%d]get lock succ.\n", getpid());
    }
}

void unlock(fd)
{
    if (flock(fd, LOCK_UN | LOCK_NB) < 0)
    {
        printf("[%d]unlock error: %s.\n", getpid(), strerror(errno));
    }
    else
    {
        printf("[%d]unlock succ.\n", getpid());
    }
}

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

    fd2 = open(LOCKFILE, O_RDWR | O_CREAT, LOCKMODE);
    if (fd2 < 0)
    {
        printf("can't open %s.\n", LOCKFILE);
        exit(1);
    }

// Locks  created by flock() are associated with an open file table entry.  This means that duplicate file descriptors (created by, for example, fork(2) or dup(2)) refer to the same
 //lock, and this lock may be modified or released using any of these descriptors.  Furthermore, the lock is released either by an explicit LOCK_UN operation on any of these  duplicate descriptors, or when all such descriptors have been closed.

// 与fcntl不同，flock的锁释放只与加锁的文件描述符有关，而且只有当所有进程的同一文件描述符都关闭时（某一进程退出时，只关闭该进程的文件描述符），锁才会释放。

    printf("parent pid: %d. fd1: %d, fd2:%d\n", getpid(), fd1, fd2);
    getlock(fd1);
    if ((pid = fork()) < 0)
    {
        printf("fork error.\n");
        exit(1);
    }
    else if (pid == 0)
    {
        printf("child pid: %d.\n", getpid());
        getlock(fd2);  
        close(fd1);
        getlock(fd2);// 需要父进程也关闭, 跟fcntl不同
        sleep(10);
        getlock(fd2);
    }
    else
    {
        sleep(1);
        close(fd1);
        while(1)
            sleep(10);
    }
    return 0;
}



//p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ ./flock_unlock_close
//parent pid: 15334.
//[15334]get lock succ.
//child pid: 15335.
//[15335]file already locked by other process.
//[15335]file already locked by other process.
//[15335]get lock succ.

