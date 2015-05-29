#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>



int main( int argc, char *argv[] )
{
    int sockfd, newsockfd, portno;
    struct sockaddr_in serv_addr, cli_addr;
    socklen_t clilen;
    sockfd = socket(AF_INET, SOCK_STREAM, 0 ); // sys/socket.h
    if (sockfd < 0)
    {
        perror("Error opening socket!");
        exit(1);
    }
    printf("build socket sucess.\n");
    /* Initialize socket structure */
    bzero((char *) &serv_addr, sizeof(serv_addr));
    portno = 8888;
    serv_addr.sin_family = AF_INET;
    //if (inet_aton(argv[1], &addr) == 0) {
    //    fprintf(stderr, "Invalid address\n");
    //    exit(EXIT_FAILURE);
    //}
    serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    serv_addr.sin_port = htons(portno);

    // 设置SO_REUSEADDR 选项不代表没有TIME_WAIT, 而是说，在TIME_WAIT状态允许再次监听
    int on = 1;
    if(setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0)
    {
        perror("setsockopt:");
        exit(EXIT_FAILURE);
    }
	struct linger so_linger;

	// 情形一
	//so_linger.l_onoff = 1;
	//so_linger.l_linger = 0;
	
	// 情形二 // 跟close行为很类似
	//
	// 跟直接close行为很类似，可能是在有数据要发送时经历停留的时间之后返回
	//
	// 除非把内核参数
	//  sudo sysctl  net.ipv4.tcp_fin_timeout=0  设为0， 才能看到连接按l_linger 的时间值断开连接
	//
	so_linger.l_onoff = 1;
	so_linger.l_linger = 5;



	// 情形三
	// 当把内核参数net.ipv4.tcp_fin_timeout 设为0 之后，同时：
	// 使用close 并且把内核参数
	//  sudo sysctl  net.ipv4.tcp_fin_timeout=0  设为0，
	//
	//  此时不会主动夭折连接，但是连接 FIN_WAIT2上停留时间极短（马上消失）而直接关闭，而且服务器会主动发送FIN报文
	//
	//
	//   对端如果再发送消息，此时会发送RST
	//
	//so_linger.l_onoff = 0;
	//so_linger.l_linger = 0;


	if (setsockopt(sockfd, SOL_SOCKET, SO_LINGER, &so_linger, sizeof(so_linger)) < 0)
	{
		perror("set so_linger error");
		exit(EXIT_FAILURE);
	}

    /* Now bind the host address using bind() call.*/
    if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    {
        perror("error on binding");
        exit(1);
    }
    printf("bind socket sucess!\n");

    /* Now start listening for the clients, here process will
     * go in sleep mode and will wait for the incoming connection
     */
    if (listen(sockfd ,5) < 0)
    {
        perror("listen failed.");
    }

    while (1)
    {
        clilen = sizeof(cli_addr);
        newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
        if (newsockfd < 0)
        {
            perror("ERROR on accept");
            exit(1);
        }
        //sleep(10);
        fprintf(stderr, "being close fd\n");
        char c = getchar();
        // 分别实验shutdown 和 close
        close(newsockfd);
        //shutdown(newsockfd, SHUT_RD);
        //shutdown(newsockfd, SHUT_WR);
        //shutdown(newsockfd, SHUT_RDWR);
        fprintf(stderr, "after close fd : close return \n");

        // 实验关闭读的一端，仍然读取数据的时候 发现还能写

        // fprintf(stderr, "continue to read\n");
        // c = getchar();
        // char recvbuf[1024] = {0};

        // memset(recvbuf, 0, sizeof(recvbuf));
        // int ret = read(newsockfd, recvbuf, sizeof(recvbuf)); // 从客户端收取数据
        // fprintf(stderr, "after read ret=%d, recvbuf:%s\n", ret, recvbuf);
        // break;



        // 实验关闭写的一端，仍然写数据的时候 进程会直接崩溃
        //char* recvbuf = "abcdefghi\n";
        //int ret = 0;
        //while(1)
        //{
        //    ret = write(newsockfd, recvbuf, strlen(recvbuf)); // 把数据再发给客户端

        //    fprintf(stderr, "write ret=%d\n", ret);
        //    sleep(5);
        //}
		//
        pause();
    }



    return 0;
}
