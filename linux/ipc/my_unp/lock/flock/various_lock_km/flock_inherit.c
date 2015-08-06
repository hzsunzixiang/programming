#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
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

    // flock锁的是文件描述符，可以被子进程继承，子进程的锁操作与父进程是同步的。
    printf("parent pid: %d.\n", getpid());
    getlock(fd1);
    getlock(fd2); // 不同的文件描述符
    if ((pid = fork()) < 0)
    {
        printf("fork error.\n");
        exit(1);
    }
    else if (pid == 0)
    {
        printf("child pid: %d.\n", getpid());
        getlock(fd1);
        getlock(fd2);
        unlock(fd1);
        getlock(fd2);
    }
    else
    {
        sleep(1); // 等待子进程释放锁 ,父子同步
        getlock(fd2); 
        while(1)
            sleep(10);
    }
    return 0;
}




//  p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ ./flock_inherit
//  parent pid: 15749.
//  [15749]get lock succ.
//  [15749]file already locked by other process.
//  child pid: 15750.
//  [15750]get lock succ.
//  [15750]file already locked by other process.
//  [15750]unlock succ.
//  [15750]get lock succ.
//  [15749]get lock succ.
//  
