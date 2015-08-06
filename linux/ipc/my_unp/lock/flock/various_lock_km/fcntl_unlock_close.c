#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>
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
        printf("[%d]fcntl error, fd: %d\n", getpid(), fd);
        exit(1);
    }

    if (fl.l_type == F_UNLCK)
        printf("[%d]file unlocked, fd:%d\n", getpid(), fd);
    else
        printf("[%d]file locked by pid: %d, fd: %d\n", getpid(), fl.l_pid, fd);
}

void getlock(fd)
{
    if (setlock(fd, F_WRLCK) < 0)
    {
        if (errno == EACCES || errno == EAGAIN)
        {
            printf("[%d]file already locked by other process, fd:%d\n", getpid(), fd);
        }
        else
        {
            printf("[%d]locked file error, fd: %d\n", getpid(), fd);
            exit(1);
        }
    }
    else
    {
        printf("[%d]get lock succ, fd:%d\n", getpid(), fd);
    }
}

void unlock(fd)
{
    if (setlock(fd, F_UNLCK) < 0)
    {
        printf("[%d]unlock error: %s, fd:%d.\n", getpid(), strerror(errno), fd);
    }
    else
    {
        printf("[%d]unlock succ, fd :%d.\n", getpid(), fd);
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

    printf("parent pid: %d fd1:%d, fd2:%d.\n", getpid(), fd1, fd2);
    getlock(fd1);
    if ((pid = fork()) < 0)
    {
        printf("fork error.\n");
        exit(1);
    }
    else if (pid == 0) // 不继承父进程设置的锁
    {
        printf("child pid: %d.\n", getpid());
        testlock(fd1);
        getlock(fd1);
        sleep(10);
        getlock(fd1);
    }
    else
    {
        sleep(1);
        close(fd2);  // 之关闭描述符
        while(1)
            sleep(10);
    }
    return 0;
}




//   p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ ./fcntl_unlock_close
//   parent pid: 14865 fd1:3, fd2:4.
//   [14865]get lock succ, fd:3
//   child pid: 14866.
//   [14866]file locked by pid: 14865, fd: 3
//   [14866]file already locked by other process, fd:3
//   [14866]get lock succ, fd:3
//   
