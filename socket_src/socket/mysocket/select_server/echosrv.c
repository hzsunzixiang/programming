#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>
#include<errno.h>
#include<signal.h>

#define MAXLINE 1024
typedef void Sigfunc(int);


Sigfunc *
signal(int signo, Sigfunc *func);
ssize_t writen(int fd, const void *buf, size_t count);

void sig_chld(int signum)
{
	pid_t pid;
	int stat;
	
	//pid = wait(&stat);
	//printf("child %d terminated\n", pid);
	
	while ( (pid = waitpid(-1, &stat, WNOHANG)) > 0)
	{
		printf("child %d terminated\n", pid);
	}
	return;

}

int main(int argc, char* argv[])
{
	int listenfd;
	struct sockaddr_in servaddr;
	if ( (listenfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
	{
		perror("socket fail!");
		exit(EXIT_FAILURE);
	}

	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(8888);
	if(argv[1] == NULL)
	{
		argv[1] = "0.0.0.0";
	}
	if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
	{
		perror("inet_aton failure!");
		printf("address:%u\n", servaddr.sin_addr.s_addr);
		exit(EXIT_FAILURE);
	}

	int on = 1;
	if(setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0)
	{
		perror("setsockopt:");
		exit(EXIT_FAILURE);
	}

	if (bind(listenfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
	{
		perror("bind error!");
		exit(EXIT_FAILURE);
	}

	int retval = listen(listenfd, SOMAXCONN);
    if(retval < 0)
    {
        perror("listen");
        exit(EXIT_FAILURE);
    }
    if (signal(SIGCHLD, sig_chld) == SIG_ERR)  // 忽略 在linux下起作用，但不可移植
        perror("signal:");


	int connfd;
    int maxfd = listenfd;
    int client[FD_SETSIZE];
    int i ;
    int maxi = -1;  // 必须初始化，
    for(i = 0; i < FD_SETSIZE; i++)
    {
        client[i] = -1;
    }

    fd_set rset, allset;

    FD_ZERO(&allset);
    FD_SET(listenfd, &allset);
    int nready;
    int sockfd;

	struct sockaddr_in cliaddr;
    char buf[MAXLINE];
    ssize_t  n;
	while(1)
	{
        rset = allset; // rset 会被select修改， allset才是需要设定的目标
        
        fprintf(stderr, "select:....maxfd = %d connfd=%d\n", maxfd, connfd);
        nready = select(maxfd + 1, &rset, NULL, NULL, NULL); 
        fprintf(stderr, "select return:....\n");
        if (nready == -1)
        {
            perror("select");
            exit(EXIT_FAILURE);
        }

        if (FD_ISSET(listenfd, &rset))
        {
            fprintf(stderr, "listenfd:....\n");
            socklen_t clilen = sizeof(cliaddr);
            memset(&cliaddr, 0, sizeof(cliaddr));
            if ((connfd = accept(listenfd, (struct sockaddr*)&cliaddr, &clilen)) < 0)
            {
                // 未必能保证所有的系统在处理信号方面都支持 SA_RESTART
                // 在信号支持SA_RESTART的情况下，这个判断没必要
                if (errno == EINTR)
                {
                    fprintf(stderr, "errno == EINTR");
                    continue;
                }
                else
                {
                    perror("accept error");
                    exit(EXIT_FAILURE);
                }
            }
            fprintf(stderr, "the client addr:port,%s:%d\n", inet_ntoa(cliaddr.sin_addr), cliaddr.sin_port);

            for (i = 0; i < FD_SETSIZE; i++)
            {
                if (client[i] < 0)
                {
                    client[i] = connfd;
                    break;
                }
            }
            if (i == FD_SETSIZE)
            {
                perror("too many clients");
                exit(EXIT_FAILURE);
            }
            FD_SET(connfd, &allset);
            if (connfd > maxfd)
                maxfd = connfd;
            if (i > maxi)
                maxi = i;
            if (--nready <= 0)
                continue;
        }

        for (i = 0; i <= maxi; i++)  // 必须有等号，不然当maxi 为0 时 ，救死循环了，因为select一直又返回，这里一直不读取
        {
            //fprintf(stderr, "i=%d:....\n", i);
            if ((sockfd = client[i]) < 0)
                continue;
            //fprintf(stderr, "FD_ISSET....\n");
            if (FD_ISSET(sockfd, &rset))
            {
                memset(buf, 0, sizeof(buf));
                if ((n = read(sockfd, buf, MAXLINE)) < 0) // 收到RST 或其他
                {
                    if (errno == ECONNRESET) // 收到reset
                    {
                        fprintf(stderr, "reset.....");
                        close(sockfd);
                        client[i] = -1;
                    }
                }
                else if(n == 0)
                {
                    fprintf(stderr, "get FIN\n");
                    close(sockfd);
                    FD_CLR(sockfd, &allset);
                    client[i] = -1;
                }
                else
                {
                    if (writen(sockfd, buf, MAXLINE) < 0)
                    {
                        perror("write to socket error");
                        exit(EXIT_FAILURE);
                    }
                }
                if (--nready <= 0)
                    break;
            }
        }
    }

    return 0;

}
ssize_t writen(int fd, const void *buf, size_t count)
{
    size_t nleft = count;
    ssize_t nwritten;
    char *bufp = (char*)buf;

    while (nleft > 0)
    {
        if ((nwritten = write(fd, bufp, nleft)) < 0)
        {
            if (errno == EINTR)
                continue;
            return -1;
        }
        else if (nwritten == 0)
            continue;

        bufp += nwritten;
        nleft -= nwritten;
    }

    return count;
}


    Sigfunc *
signal(int signo, Sigfunc *func)
{
    struct sigaction act, oact;

    act.sa_handler = func;
    sigemptyset(&act.sa_mask);
    act.sa_flags = 0;
    if (signo == SIGALRM)
    {
#ifdef SA_INTERRUPT
        act.sa_flags |= SA_INTERRUPT;
#endif
    }
    else
    {
#ifdef SA_RESTART
        act.sa_flags |= SA_RESTART;
#endif
    }

    if (sigaction(signo, &act, &oact) < 0)
        return SIG_ERR;
    return oact.sa_handler;

}
