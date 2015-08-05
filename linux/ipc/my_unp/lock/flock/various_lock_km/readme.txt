http://km.oa.com/group/906/articles/show/225987?kmref=related_post


linux文件锁之fcntl与flock深入比较
hetiulin  2015年05月13日 16:48  浏览(496)  收藏(63)  评论(13)  
分享
1.    简介
在Linux系统中，若两个进程同时写同一个文件，该文件的状态取决于写该文件的最后一个进程。但是，对于有些应用程序（例如数据库），进程有时需要确保它正在单独写一个文件。

文件锁的功能是：当一个进程正在读或写文件的某个部分时，它可以阻止其他进程修改同一文件区。

1.1. 协同锁与强制锁
Linux系统中有两种常用的文件锁：协同锁和强制锁。

协同锁要求参与操作的进程之间协同合作。假设进程“A”获得一个WRITE锁，并开始向文件中写入内容；此时，进程“B”并没有试图获取一个锁，它仍然可以打开文件并向文件中写入内容。在此过程中，进程“B”就是一个非合作进程。如果进程“B”试图获取一个锁，那么整个过程就是一个合作的过程，从而可以保证操作的“序列化”。只有当参与操作的进程是协同合作的时候，协同锁才能发挥作用。协同锁有时也被称为“非强制”锁。

强制锁不需要参与操作的进程之间保持协同合作。它利用内核来查检每个打开、读取、写入操作，从而保证在调用这些操作时不违反文件上的锁规则。为了使能Linux中的强制锁功能，你需要在文件系统级别上打开它，同时在单个文件上打开它。其步骤是：

1.      挂载文件系统时使用“-o mand”参数；

2.      对于要打开强制锁功能的文件lock_file，必须打开set-group-ID位，关闭group-execute位（选择此方法的原因是，当你关闭group-execute时，设置set-group-ID就没有实际的意义了）。

一般情况下，我们只使用协同锁，因此本文也只讨论协同锁。

1.2. 读锁与写锁
在 Linux 中，不论进程是在使用协同锁还是强制锁，它都可以同时使用共享锁与排他锁（又称为读锁和写锁）。多个共享锁之间不会相互干扰，多个进程在同一时刻可以对同一个文件加共享锁。但是，如果一个进程对该文件加了排他锁，那么其他进程则无权再对该文件加共享锁或者排他锁，直到该排他锁被释放。所以，对于同一个文件来说，它可以同时拥有很多读者，但是在某一特定时刻，它只能拥有一个写者，它们之间的兼容关系如下表所示。

 
请求
读锁
写锁
当前加上的锁
无锁
允许
允许
读锁
允许
拒绝
写锁
拒绝
拒绝
 

Linux实现文件锁的函数主要有fcntl和flock（还有一个lockf函数，其实质是fcntl的包装，这里就不作详细介绍）。

2.    fcntl与flock测试
flock只能加全局锁，fcntl可以加全局锁也可以加局部锁。为了比较fcntl与flock的区别，我们通过代码来进行测试。为了简单起见，这里只展示写锁和全局锁的场景，其他场景是同样适用的。

2.1. 重复加锁
2.1.1.    fcntl
上面说明的读锁与写锁的兼容关系适用于不同进程提出的锁请求，并不适用于单个进程提出的多个锁请求。如果一个进程对一个文件已经加了一把锁，后来该进程又企图在同一个文件再加一把锁，那么新锁将替换老锁，而不管该加锁请求是否针对同一个文件描述符。

代码：

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
    getlock(fd2);
    getlock(fd1);
    getlock(fd2);

    return 0;
}
输出：



结论：

同一进程对同一文件多次调用fcntl加锁，都视为只加一把锁。

2.1.2.    flock
与fcntl类似，flock对同一文件描述符多次加锁，那么新锁将替换老锁；然而，如果针对同一文件的不同文件描述符加锁，将视为不同的锁，此时的锁请求失败（或阻塞）。

代码：

#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
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

    printf("parent pid: %d.\n", getpid());
    getlock(fd1);
    getlock(fd2);
    getlock(fd1);
    getlock(fd2);

    return 0;
}
结果：



结论：

对同一文件描述符多次调用flock加锁，都视为只加一把锁。

2.2. 锁的释放
2.2.1.    fcntl
fcntl加的锁与进程和文件两方面有关，这有两重含义：

1.      当一个进程终止时，它所建立的锁全部释放。

代码：

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
        sleep(10);
        getlock(fd);
    }
    else
    {
        sleep(1);
        exit(0);
    }
    return 0;
}
结果：



2.      任何时候关闭一个文件描述符，则该进程通过这一文件描述符可以引用的文件上的任何一把锁都被释放。

代码：

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
        testlock(fd1);
        getlock(fd1);
        sleep(10);
        getlock(fd1);
    }
    else
    {
        sleep(1);
        close(fd2);
        while(1)
            sleep(10);
    }
    return 0;
}
结果：



2.2.2.    flock
与fcntl不同，flock的锁释放只与加锁的文件描述符有关，而且只有当所有进程的同一文件描述符都关闭时（某一进程退出时，只关闭该进程的文件描述符），锁才会释放。

代码：

#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
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
        close(fd1);
        getlock(fd2);
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
结果：



2.3. 锁的继承
2.3.1.    fcntl
通过fcntl获得的文件锁，是与当前进程绑定的，且对于同一个文件，无论打开多少个文件描述符，都只能有一个类型的锁（写锁），而由fork产生的子进程不继承父进程所设置的锁。

这意味着，若一个进程得到一把锁，然后调用fork，那么对于父进程获得的锁而言，子进程被视为另一个进程，对于从父进程继承过来的任一描述符，子进程都需要调用fcntl才能获得它自己的锁（此时子进程的锁请求失败）。而我们知道，对于父进程，任何时候对同一个文件调用fcntl获取锁都能成功。

另一方面，对于从父进程继承过来的任一描述符，子进程的任何解锁操作（F_UNLCK）都是无效的。

这与锁的作用是相一致的。锁的作用是阻止多个进程同时写同一个文件，如果子进程继承父进程的锁，则父、子进程就可以同时写同一个文件了。

代码：

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
输出：



结论：

fcntl锁的是文件（inode结点），不能被子进程继承。

2.3.2.    flock
通过flock获得的文件锁，是与当前文件描述符绑定的。这意味着，若一个进程得到一把锁，然后调用fork，那么对于父进程获得的锁而言，子进程从父进程继承过来的已加锁的文件描述符，不需要调用flock再次获得它自己的锁。

另一方面，对于从父进程继承过来的任一文件描述符，子进程对其加锁或解锁（LOCK_UN）操作同样影响到父进程的同一文件描述符。

代码：

#include <sys/file.h>
#include <unistd.h>
#include <stdio.h>
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

    printf("parent pid: %d.\n", getpid());
    getlock(fd1);
    getlock(fd2);
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
        sleep(1);
        getlock(fd2);
        while(1)
            sleep(10);
    }
    return 0;
}
结果：



结论：

flock锁的是文件描述符，可以被子进程继承，子进程的锁操作与父进程是同步的。

2.4. fcntl与flock混合使用
2.4.1.    先fcntl后flock
当给一个文件加fcntl锁后，再给这个文件的同一文件描述加flock锁，其会永远成功。

代码：

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
    getlock(fd1);
    getlock2(fd1);
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
        getlock2(fd2);
        getlock2(fd1);
    }   
    else
    {   
        while(1)
            sleep(10);
    }   

    return 0;
}
结果：



结论：

flock的操作结果与fcntl独立，不能混合使用flock和fcntl。

2.4.2.    先flock后fcntl

当给一个文件加flock锁后，再给这个文件加fcntl锁，其会永远成功。


代码：

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
结果：



结论：

fcntl的操作结果与flock独立，不能混合使用flock和fcntl。
