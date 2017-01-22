
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<signal.h>


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

	if(argv[1] == NULL)
	{
		argv[1] = "127.0.0.1";
	}

    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(5188);
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
    char sendbuf[1024] = {0};
    while(1){
        memset(recvbuf, 0, sizeof(recvbuf));
        memset(sendbuf, 0, sizeof(sendbuf));
        char * tmp = fgets(sendbuf, sizeof(sendbuf), stdin); // 键入EOF时，fgets返回一个空指针
        //fputs("fget from stdin\n", stderr);
        if (tmp != NULL)
        {
            //fputs("write to socket\n", stderr);
            if (write(sockconn, sendbuf, strlen(sendbuf)) < 0)
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
        //fputs("read from connfd\n", stderr);
        int ret = read(sockconn, recvbuf, sizeof(recvbuf));
        if (ret != 0)
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
