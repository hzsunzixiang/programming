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


typedef void Sigfunc(int);

Sigfunc *
signal(int signo, Sigfunc *func);
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

ssize_t readline(int sockfd, void *buf, size_t maxline);
ssize_t writen(int fd, const void *buf, size_t count);
void do_service(int connfd);

int main(int argc, char* argv[])
{
	int sockfd;
	struct sockaddr_in servaddr;
	if ( (sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
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
	if(setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0)
	{
		perror("setsockopt:");
		exit(EXIT_FAILURE);
	}

	if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
	{
		perror("bind error!");
		exit(EXIT_FAILURE);
	}

	listen(sockfd, SOMAXCONN);
    if (signal(SIGCHLD, sig_chld) == SIG_ERR)  // 忽略 在linux下起作用，但不可移植
        perror("signal:");


	struct sockaddr_in cliaddr;
	int connfd;
	pid_t pid;

	while(1)
	{
		socklen_t clilen = sizeof(cliaddr);
		memset(&cliaddr, 0, sizeof(cliaddr));
		if ((connfd = accept(sockfd, (struct sockaddr*)&cliaddr, &clilen)) < 0)
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

        pid = fork();
        if (pid == 0)  //子进程
        {
            close(sockfd);
            do_service(connfd);
            exit(0);
        }
        else if (pid < 0)
        {
            perror("fork error");
            exit(EXIT_FAILURE);
        }
        close(connfd);

    }
    fputs("will close connfd\n", stderr);
    close(connfd);
    return 0;
}


void do_service(int connfd)
{
    char recvbuf[1024] = {0};
    while(1)
    {
        memset(recvbuf, 0, sizeof(recvbuf));
        int ret = read(connfd, recvbuf, sizeof(recvbuf)); // 从客户端收取数据
        fputs(recvbuf, stderr); // 把结果打印出来
        if (ret > 0)
        {
            if(write(connfd, recvbuf, ret) < 0)  // 把数据再发给客户端
            {
                perror("write error");
                exit(EXIT_FAILURE);
            }
        }
        else if (ret == 0) //  从客户端接受FIN报文
        {
            fputs("receive FIN from client\n", stderr);
            break;
        }
        else if(ret < 0 && errno == EINTR )
        {
            fputs("receive SIGNAL from client\n", stderr);
            continue;
        }
        else //为-1 比如是RST，  客户端分两次write数据时， 如果客户端使用read而不是readline， 那么客户端的缓冲区可能一直存有数据，而客户端不去读取
        {    //  这时如果强制关闭客户端，那么客户端会发送RST
            perror("read error");
            close(connfd);
            exit(EXIT_FAILURE);
        }
    }
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
ssize_t recv_peek(int sockfd, void *buf, size_t len)
{
    while (1)
    {
        int ret = recv(sockfd, buf, len, MSG_PEEK);
        if (ret == -1 && errno == EINTR)
            continue;
        return ret;
    }
}


ssize_t readn(int fd, void *buf, size_t count)
{
    size_t nleft = count;
    ssize_t nread;
    char *bufp = (char*)buf;

    while (nleft > 0)
    {
        if ((nread = read(fd, bufp, nleft)) < 0)
        {
            if (errno == EINTR)
                continue;
            return -1;
        }
        else if (nread == 0)
            return count - nleft;

        bufp += nread;
        nleft -= nread;
    }

    return count;
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

ssize_t readline(int sockfd, void *buf, size_t maxline)
{
    int ret;
    int nread;
    char *bufp = buf;
    int nleft = maxline;
    while (1)
    {
        ret = recv_peek(sockfd, bufp, nleft);
        if (ret < 0)
            return ret;
        else if (ret == 0)
            return ret;

        nread = ret;
        int i;
        for (i=0; i<nread; i++)
        {
            if (bufp[i] == '\n')
            {
                ret = readn(sockfd, bufp, i+1);
                if (ret != i+1)
                    exit(EXIT_FAILURE);

                return ret;
            }
        }

        if (nread > nleft)
            exit(EXIT_FAILURE);

        nleft -= nread;
        ret = readn(sockfd, bufp, nread);
        if (ret != nread)
            exit(EXIT_FAILURE);

        bufp += nread;
    }

    return -1;
}


