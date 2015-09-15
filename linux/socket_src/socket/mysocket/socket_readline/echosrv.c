#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>
#include<errno.h>


ssize_t readline(int sockfd, void *buf, size_t maxline);
ssize_t writen(int fd, const void *buf, size_t count);

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
	char recvbuf[1024] = {0};
	struct sockaddr_in cliaddr;
	int connfd;
	socklen_t clilen = sizeof(cliaddr);
	memset(&cliaddr, 0, sizeof(cliaddr));
	if ((connfd = accept(sockfd, (struct sockaddr*)&cliaddr, &clilen)) < 0)
	{
		perror("accept error");
		exit(EXIT_FAILURE);
	}
	fprintf(stderr, "the client addr:port,%s:%d\n", inet_ntoa(cliaddr.sin_addr), cliaddr.sin_port);

	//setvbuf (stderr, NULL , _IONBF , 1024 );
	//setvbuf (stdout, NULL , _IONBF , 1024 );
	while(1)
	{
		memset(recvbuf, 0, sizeof(recvbuf));
		fprintf(stderr, "begin to read\n");
		int ret = read(connfd, recvbuf, sizeof(recvbuf)); // 从客户端收取数据
		fprintf(stderr, "retr=%d\n", ret);
		fputs(recvbuf, stdout); // 把结果打印出来
		if (ret > 0)
		{
			int retw = 0;
			if((retw=writen(connfd, recvbuf, strlen(recvbuf))) < 0)  // 把数据再发给客户端
			{
				perror("write error");
				exit(EXIT_FAILURE);
			}
			fprintf(stderr, "write over: retw=%d\n", retw);
		}
		else if (ret == 0) //  从客户端接受FIN报文
		{
			//sleep(10); // 在客户端正常终止时，为了查看close_wait 和 FIN_WAIT_2
			fputs("receive FIN from client\n", stderr);
			break;
		}
		else //  客户端分两次write数据时， 如果客户端使用read而不是readline， 那么客户端的缓冲区可能一直存有数据，而客户端不去读取
		{    //  这时如果强制关闭客户端，那么客户端会发送RST
			perror("read error");
			close(connfd);
			exit(EXIT_FAILURE);
		}
	}

	fputs("will close connfd\n", stderr);
	close(connfd);

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


