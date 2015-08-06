#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
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
        printf("[%d]fcntl error.\n", getpid());
        exit(1);
    }

    if (fl.l_type == F_UNLCK)
        printf("[%d]file unlocked.\n", getpid());
    else
        printf("[%d]file locked by pid: %d.\n", getpid(), fl.l_pid);
}

void getlock(fd)
{
    if (setlock(fd, F_WRLCK) < 0)
    {
        if (errno == EACCES || errno == EAGAIN)
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
    if (setlock(fd, F_UNLCK) < 0)
    {
        printf("[%d]unlock error: %s.\n", getpid(), strerror(errno));
    }
    else
    {
        printf("[%d]unlock succ.\n", getpid());
    }
}
// fcntl锁的是文件（inode结点），不能被子进程继承。
int main()
{
    int fd;
    pid_t pid;

    fd = open(LOCKFILE, O_RDWR | O_CREAT, LOCKMODE);
    if (fd < 0)
    {
        printf("can't open %s.\n", LOCKFILE);
        exit(1);
    }

    printf("parent pid: %d.\n", getpid());
    getlock(fd);
    if ((pid = fork()) < 0)
    {
        printf("fork error.\n");
        exit(1);
    }
    else if (pid == 0)
    {
        printf("child pid: %d.\n", getpid());
        testlock(fd);
        getlock(fd);
    }
    else
    {
        while(1)
            sleep(10);
    }
    return 0;
}


//   p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ ./fcntl_inherit
//   parent pid: 15601.
//   [15601]get lock succ.
//   child pid: 15602.
//   [15602]file locked by pid: 15601.
//   [15602]file already locked by other process.




