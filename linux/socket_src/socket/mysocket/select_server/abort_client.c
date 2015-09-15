#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

void handle_pipe(int sig);

int main(int argc, char *argv[])
{
	int sock;
	struct sigaction action;
	action.sa_handler = handle_pipe;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;
	sigaction(SIGPIPE, &action, NULL);

	if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
	{
		perror("build socket fail");
		exit(1);
	}

	struct sockaddr_in servaddr;
	memset(&servaddr, 0, sizeof(servaddr));

	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(8888);

    if(argv[1] == NULL)
    {
        argv[1] = "127.0.0.1";
    }
	if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
	{
		perror("inet_aton fail!");
		exit(1);
	}


	if (connect(sock, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
	{
		perror("connect fail");
		exit(1);
	}


	// 下面是夭折该连接时，服务器的输出行为
	//select return:....
	//listenfd:....
	//the client addr:port,192.168.1.101:43172
	//select:....maxfd = 4 connfd=4
	//select return:....
	//reset.....select:....maxfd = 4 connfd=4
	//select return:....
	//select: Bad file descriptor
	
	//
	// 夭折该连接
	// 夭折之后，服务器端的accept仍然会返回正常的描述符，此时select操作的时候就会 报错  //select: Bad file descriptor
	struct linger so_linger;
	so_linger.l_onoff = 1;
	so_linger.l_linger = 0;
	if (setsockopt(sock, SOL_SOCKET, SO_LINGER, &so_linger, sizeof(so_linger)) < 0)
	{
		perror("set so_linger error");
		exit(EXIT_FAILURE);
	}

	fprintf(stderr, "being close fd\n");

	close(sock);
	fprintf(stderr, "after close fd\n");

	//c = getchar();
	pause();

	return 0;
}


void handle_pipe(int sig)
{
	printf("receive pipe!\n");
}

