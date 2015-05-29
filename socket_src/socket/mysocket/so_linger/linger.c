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
	fprintf(stderr, "being close fd\n");

	// 实验关闭读的一端，仍然读取数据的时候
	//char* recvbuf = "abcdefghi\n";
	//while(1)
	//{
	//    if(write(sock, recvbuf, strlen(recvbuf)) < 0)  // 把数据再发给客户端
	//    {
	//        perror("write error");
	//        exit(EXIT_FAILURE);
	//    }
	//    sleep(5);
	//}


	//char c = getchar();
	//while(1)
	//{
	//    if(write(sock, recvbuf, strlen(recvbuf)) < 0)  // 把数据再发给客户端
	//    {
	//        perror("write error");
	//        exit(EXIT_FAILURE);
	//    }
	//	break;
	//}
	//

	char c = getchar();
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

