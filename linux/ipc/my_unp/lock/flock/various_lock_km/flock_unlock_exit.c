#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
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

    printf("parent pid: %d.\n", getpid());
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
        sleep(10);
        getlock(fd2);  // 文件描述符的锁 fd1占着 不会成功，
    }
    else
    {
        sleep(1);
        exit(1);
    }
    return 0;
}
//   p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ ./flock_unlock_exit
//   parent pid: 15919.
//   [15919]get lock succ.
//   child pid: 15920.
//   [15920]file already locked by other process.
//   p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ [15920]file already locked by other process.

