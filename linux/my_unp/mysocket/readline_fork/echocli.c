
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<signal.h>

#include <errno.h>

void handle_pipe(int sig);
ssize_t readline(int sockfd, void *buf, size_t maxline);
ssize_t writen(int fd, const void *buf, size_t count);
int main(int argc, char* argv[])
{
	struct sigaction action;
	action.sa_handler = handle_pipe;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;
	sigaction(SIGPIPE, &action, NULL);
	int sockconn;
	struct sockaddr_in servaddr;
	if ((sockconn = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
	{
		perror("socket failure");
		exit(EXIT_FAILURE);
	}

	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(8888);
	if(argv[1] == NULL)
	{
		argv[1] = "127.0.0.1";
	}
	if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
	{
		perror("inet_aton error");
		exit(EXIT_FAILURE);
	}

	if (connect(sockconn, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
	{
		perror("connnect error");
		exit(EXIT_FAILURE);
	}
	char recvbuf[1024];
	char sendbuf[1024];
	while(1){
		memset(recvbuf, 0, sizeof(recvbuf));
		memset(sendbuf, 0, sizeof(sendbuf));
		char * tmp = fgets(sendbuf, sizeof(sendbuf), stdin); // 键入EOF时，fgets返回一个空指针
		//fputs("fget from stdin\n", stderr);
		if (tmp != NULL)
		{
			int retw = 0;
			if ((retw = write(sockconn, sendbuf, strlen(sendbuf))) < 0)
			{
				perror("write to socket error");
				exit(EXIT_FAILURE);
			}

		}
		else // 键入EOF时也返回空指针
		{
			fputs("get EOF\n", stderr);
			break;
		}

		int ret = readline(sockconn, recvbuf, sizeof(recvbuf));
		if (ret > 0)
			fputs(recvbuf, stdout);
		else if (ret == 0) // 已经写往服务器了，所以应该收到数据，如果返回0，说明服务器已经过早终止了
		{
			perror("str_cli: server terminated prematurely");
			exit(EXIT_FAILURE);
		}
		else
		{
			perror("read error");
			exit(EXIT_FAILURE);
		}
	}
	close(sockconn); // 这里即使不close，在进程关闭的时候，仍然会会关闭
	return 0;
}
void handle_pipe(int sig)
{
	printf("receive pipe!\n");
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


