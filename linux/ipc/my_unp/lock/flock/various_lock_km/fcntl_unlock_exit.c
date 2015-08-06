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
        printf("[%d]fcntl error, fd: %d\n", getpid(), fd);
        exit(1);
    }

    if (fl.l_type == F_UNLCK)
        printf("[%d]file unlocked, fd:%d\n", getpid(), fd);
    else
        printf("[%d]file locked by pid: %d, fd : %d\n", getpid(), fl.l_pid, fd);
}

void getlock(fd)
{
    if (setlock(fd, F_WRLCK) < 0)
    {
        if (errno == EACCES || errno == EAGAIN)
        {
            printf("[%d]file already locked by other process, fd :%d\n", getpid(), fd);
        }
        else
        {
            printf("[%d]locked file error.fd: %d\n", getpid(), fd);
            exit(1);
        }
    }
    else
    {
        printf("[%d]get lock succ. fd: %d\n", getpid(), fd);
    }
}

void unlock(fd)
{
    if (setlock(fd, F_UNLCK) < 0)
    {
        printf("[%d]unlock error: %s, fd:%d\n", getpid(), strerror(errno), fd);
    }
    else
    {
        printf("[%d]unlock succ,  fd: %d\n", getpid(), fd);
    }
}

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

    printf("parent pid: %d, fd: %d \n", getpid(), fd);
    getlock(fd);
    if ((pid = fork()) < 0)
    {
        printf("fork error.\n");
        exit(1);
    }
    else if (pid == 0)
    {
        printf("child pid: %d.\n", getpid());
        testlock(fd); // 被其他进程占用着
        getlock(fd);  // 获取失败
        sleep(10);
        getlock(fd);  //  父进程退出，子进程成获取成功
    }
    else
    {
        sleep(1);
        exit(0);
    }
    return 0;
}






//  p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ ./fcntl_unlock_exit
//  parent pid: 12539, fd: 3
//  [12539]get lock succ. fd: 3
//  child pid: 12540.
//  [12540]file locked by pid: 12539, fd : 3
//  [12540]file already locked by other process, fd :3
//  p_jdzxsun@centos7:~/programming/linux/ipc/my_unp/lock/flock/various_lock_km$ [12540]get lock succ. fd: 3

