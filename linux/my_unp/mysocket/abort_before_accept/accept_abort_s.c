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
        fprintf(stderr, "accept begin\n");
		sleep(20); // 等待客户端夭折该链接
        newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
        fprintf(stderr, "accept return newsockfd=%d\n", newsockfd);
        if (newsockfd < 0)
        {
            perror("ERROR on accept");
            exit(1);
        }
        fprintf(stderr, "being close fd\n");
        close(newsockfd);
        fprintf(stderr, "after close fd : close return \n");

        pause();
    }



    return 0;
}
