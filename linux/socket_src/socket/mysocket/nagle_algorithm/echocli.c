#include<linux/tcp.h>  // TCP_NODELAY
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<signal.h>
#include<time.h>


//p_jdzxsun@centos7:~/programming/socket_src/socket/mysocket/nagle_algorithm$ sudo find /usr/ -name "*.h" |xargs  grep "TCP_NODELAY"
///usr/include/linux/tcp.h:#define TCP_NODELAY            1       /* Turn off Nagle's algorithm. */
///usr/include/netinet/tcp.h:#define      TCP_NODELAY      1      /* Don't delay send to coalesce packets  */
///usr/src/kernels/3.10.0-229.1.2.el7.x86_64/include/uapi/linux/tcp.h:#define TCP_NODELAY         1       /* Turn off Nagle's algorithm. */

void handle_pipe(int sig);
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

	int enable = 1;
	setsockopt(sockconn, IPPROTO_TCP, TCP_NODELAY, (void*)&enable, sizeof(enable));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(8888);
	if (argv[1] == NULL)
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
	char recvbuf[1024] = {0};
	char sendbuf[1] = {0};
	char *str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

	int i = 0;
	for (i = 0; i < 4; i++)
	{
		memset(recvbuf, 0, sizeof(recvbuf));
		memset(sendbuf, 0, sizeof(sendbuf));


		srand((unsigned int)time((time_t *)NULL));//使用系统时间来初始化随机数发生器
		int lstr = strlen(str);//计算字符串长度
		sendbuf[0] = str[(rand()%lstr)];//rand()%lstr 可随机返回0-71之间的整数, str[0-71]可随机
		if (write(sockconn, sendbuf, strlen(sendbuf)) < 0)
		{
			perror("write to socket error");
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
