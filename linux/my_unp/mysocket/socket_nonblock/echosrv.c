#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>


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
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	//if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
	//{
	//	perror("inet_aton failure!");
	//	printf("address:%u\n", servaddr.sin_addr.s_addr);
	//	exit(EXIT_FAILURE);
	//}


	int on = 1;
	if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)))
	{
		perror("setsockopt error");
		exit(EXIT_FAILURE);
	}
	if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
	{
		perror("bind error!");
		exit(EXIT_FAILURE);
	}

	listen(sockfd, SOMAXCONN);
	struct sockaddr_in cliaddr;
	int connfd;
	pid_t pid;

	while(1)
	{
		socklen_t clilen = sizeof(cliaddr);
		memset(&cliaddr, 0, sizeof(cliaddr));
		if ((connfd = accept(sockfd, (struct sockaddr*)&cliaddr, &clilen)) < 0)
		{
			perror("accept error");
			exit(EXIT_FAILURE);
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


//正常启动
//p_jdzxsun@centos7:~$ ps   -eo pid,ppid,tty,stat,args,wchan | grep echo |grep -v grep|grep -v vim
//21379 20986 pts/22   S+   ./echosrv 192.168.1.101     inet_csk_accept
//21380 21029 pts/23   S+   ./echocli 192.168.1.101     n_tty_read
//21403 21379 pts/22   S+   ./echosrv 192.168.1.101     sk_wait_data
//21414 21073 pts/24   S+   ./echocli 192.168.1.101     n_tty_read
//21415 21379 pts/22   S+   ./echosrv 192.168.1.101     sk_wait_data
//
//
// WCHAN     address of the kernel function where the process is sleeping (use wchan if you want the kernel function name).  Running tasks will display a dash ('-') in this column.
//
//
// 客户端结束之后，有个僵尸进程
//
// p_jdzxsun@centos7:~$ ps   -eo pid,ppid,tty,stat,args,wchan | grep echo |grep -v grep|grep -v vim
// 21379 20986 pts/22   S+   ./echosrv 192.168.1.101     inet_csk_accept
// 21380 21029 pts/23   S+   ./echocli 192.168.1.101     n_tty_read
// 21403 21379 pts/22   S+   ./echosrv 192.168.1.101     sk_wait_data
// 21415 21379 pts/22   Z+   [echosrv] <defunct>         exit
//



