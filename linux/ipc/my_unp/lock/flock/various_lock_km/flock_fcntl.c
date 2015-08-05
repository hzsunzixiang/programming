#include <fcntl.h>
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

void getlock2(fd)
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

void unlock2(fd)
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
    }   
    else
    {   
        while(1)
            sleep(10);
    }   

    return 0;
}
