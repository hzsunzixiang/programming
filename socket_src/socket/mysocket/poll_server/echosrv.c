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
#include<poll.h>

#include<limits.h> // for OPEN_MAX
#define OPEN_MAX 1024
#define MAXLINE 1024
typedef void Sigfunc(int);

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
    int i ;
    int maxi = 0;  // 必须初始化，

	struct pollfd client[OPEN_MAX];


	client[0].fd = listenfd;
	//client[0].events = POLLRDNORM;
	client[0].events = POLLIN;
    for(i = 1; i < OPEN_MAX; i++)
    {
        client[i].fd = -1;
    }


    int nready;
    int sockfd;

	struct sockaddr_in cliaddr;
    char buf[MAXLINE];
    ssize_t  n;
	while(1)
	{
        fprintf(stderr, "poll:.... maxi=%d\n", maxi);
        nready = poll(client, maxi + 1, -1);  // 改成超时的看看行为
        fprintf(stderr, "poll return:....\n");
        if (nready == -1)
        {
			// 如果客户端连接之后马上夭折，此时 跟select表现不一致
			// 客户端夭折之后，服务器端的accept仍然会返回正常的描述符，此时select操作这个描述符的时候就会 报错  //select: Bad file descriptor
			// poll 此时不会报错，收到RST  而返回 errno == ECONNRESET   
            perror("poll");  // select: Bad file descriptor;  poll 不在这里报错
            //exit(EXIT_FAILURE);  // 如果此时断开，则程序健壮性太差，应该打印日志，然后循环
        }

        if (client[0].revents & POLLIN)  // new client connection
        {
            fprintf(stderr, "listenfd:....\n");
            socklen_t clilen = sizeof(cliaddr);
            memset(&cliaddr, 0, sizeof(cliaddr));
            //fprintf(stderr, "accept:....\n");
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
			//sleep(10);
            //fprintf(stderr, "accept return:....\n");
            fprintf(stderr, "the client addr:port,%s:%d\n", inet_ntoa(cliaddr.sin_addr), cliaddr.sin_port);

            for (i = 1; i < OPEN_MAX; i++)
            {
                if (client[i].fd < 0)
                {
                    client[i].fd = connfd;
                    break;
                }
            }
            if (i == OPEN_MAX)
            {
                perror("too many clients");
                exit(EXIT_FAILURE);
            }
			client[i].events = POLLIN;
            if (i > maxi)
                maxi = i;
            if (--nready <= 0)
                continue;
        }

        for (i = 1; i <= maxi; i++)  // 必须有等号，不然当maxi 为0 时 ，就死循环了，因为select一直又返回，这里一直不读取
        {
            //fprintf(stderr, "i=%d:....\n", i);
            if ((sockfd = client[i].fd) < 0)
                continue;
            //fprintf(stderr, "FD_ISSET....\n");
            if (client[i].revents & (POLLIN | POLLERR))
            {
                memset(buf, 0, sizeof(buf));
				//如果使用readline函数，可能会遭受拒绝服务攻击
				//客户端只发送几个字节，不发送换行符，那么此时服务器不能响应其他客户端的服务
                //if ((n = readline(sockfd, buf, MAXLINE)) < 0) // 收到RST 或其他
                if ((n = read(sockfd, buf, MAXLINE)) < 0) // 收到RST 或其他
                {
                    if (errno == ECONNRESET) // 收到reset  跟用select行为有些不一致，在客户端夭折连接的是偶，会走到这里
                    {
                        fprintf(stderr, "reset.....\n");
                        close(sockfd);
                        client[i].fd = -1;
                    }
                }
                else if(n == 0)
                {
                    fprintf(stderr, "get FIN\n");
                    close(sockfd);
                    client[i].fd = -1;
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

