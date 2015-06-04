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

#define max(x,y) ((x) > (y) ? (x) : (y))
#define MAXLINE 1024
typedef void Sigfunc(int);
void do_service(int connfd);

ssize_t readline(int sockfd, void *buf, size_t maxline);

Sigfunc *
signal(int signo, Sigfunc *func);
ssize_t writen(int fd, const void *buf, size_t count);

void sig_chld(int signum)
{
	pid_t pid;
	int stat;
	
	while ( (pid = waitpid(-1, &stat, WNOHANG)) > 0)
	{
		printf("child %d terminated\n", pid);
	}
	return;

}

int main(int argc, char* argv[])
{
	int listenfd, udpfd;
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
    // udp socket

    if ( (udpfd= socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0)
    {
        perror("socket fail!");
        exit(EXIT_FAILURE);
    }

    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton failure!");
        printf("address:%u\n", servaddr.sin_addr.s_addr);
        exit(EXIT_FAILURE);
    }
    if (bind(udpfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
    {
        perror("bind error!");
        exit(EXIT_FAILURE);
    }



    fd_set rset;

    int nready;
	struct sockaddr_in cliaddr;
    FD_ZERO(&rset);
    int maxfd = max(listenfd, udpfd);
	while(1)
	{
        FD_SET(listenfd, &rset);
        FD_SET(udpfd, &rset);
        fprintf(stderr, "select:....maxfd = %d \n", maxfd);
        nready = select(maxfd + 1, &rset, NULL, NULL, NULL); 
        fprintf(stderr, "select return:....\n");
        if (nready == -1)
        {
			// 如果客户端连接之后马上夭折，此时
			// 客户端夭折之后，服务器端的accept仍然会返回正常的描述符，此时select操作这个描述符的时候就会 报错  //select: Bad file descriptor
			// 
            perror("select");  // select: Bad file descriptor
            //exit(EXIT_FAILURE);  // 如果此时断开，则程序健壮性太差，应该打印日志，然后循环
        }

        if (FD_ISSET(listenfd, &rset))
        {
            fprintf(stderr, "listenfd:....\n");
            socklen_t clilen = sizeof(cliaddr);
            memset(&cliaddr, 0, sizeof(cliaddr));
            int connfd;
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
                    //exit(EXIT_FAILURE);
					close(connfd);
					continue;
                }
            }
            fprintf(stderr, "the client addr:port,%s:%d\n", inet_ntoa(cliaddr.sin_addr), cliaddr.sin_port);
            pid_t pid = fork();
            if (pid == 0)  //子进程
            {
                close(listenfd);
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
        /// udp
        if (FD_ISSET(udpfd, &rset))
        {
            socklen_t len = sizeof(cliaddr);
            char mesg[1024];
            int n = recvfrom(udpfd, mesg, 1024, 0, (struct sockaddr*)&cliaddr, &len); // 从客户端收取数据
            fputs(mesg, stderr); // 把结果打印出来
            if (n >= 0)
            {
                if(sendto(udpfd, mesg, n, 0, (struct sockaddr*)&cliaddr, len) < 0)  // 把数据再发给客户端
                {
                    perror("sendto error");
                    exit(EXIT_FAILURE);
                }
            }
            else
            {
                perror("read error");
                exit(EXIT_FAILURE);
            }

        }

    }

    return 0;

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

ssize_t writen(int fd, const void *buf, size_t count) {
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
            sleep(10); // 在客户端正常终止时，为了查看close_wait 和 FIN_WAIT_2
            fputs("receive FIN from client\n", stderr);
            break;
        }
        else // 为 -1 ，可能是RST
        {
            perror("read error");
            close(connfd);
            exit(EXIT_FAILURE);
        }
    }
}
