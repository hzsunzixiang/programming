#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

// root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/socket_option# ./acceptconn
// build socket sucess.
// bind socket sucess!
// before listening:the SO_ACCEPTCONN: 0
// after listening:the SO_ACCEPTCONN: 1
// the new socket,the SO_ACCEPTCONN: 0

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

	int conn = -1;
	socklen_t len = sizeof(int);
	if (getsockopt(sockfd, SOL_SOCKET, SO_ACCEPTCONN, &conn, &len) <0)
	{
		fprintf(stderr, "getsockopt failure");
		perror("getsockopt so_error failure");
		return -1;
	}
	printf("before listening:the SO_ACCEPTCONN: %d\n", conn);
    /* Now start listening for the clients, here process will
     * go in sleep mode and will wait for the incoming connection
     */
    if (listen(sockfd ,5) < 0)
    {
		perror("listen failed.");
	}

	if (getsockopt(sockfd, SOL_SOCKET, SO_ACCEPTCONN, &conn, &len) <0)
	{
		fprintf(stderr, "getsockopt failure");
		perror("getsockopt so_error failure");
		return -1;
	}
	printf("after listening:the SO_ACCEPTCONN: %d\n", conn);

	while (1)
	{
		clilen = sizeof(cli_addr);
		newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
		if (newsockfd < 0)
		{
			perror("ERROR on accept");
			exit(1);
		}
		if (getsockopt(newsockfd, SOL_SOCKET, SO_ACCEPTCONN, &conn, &len) <0)
		{
			fprintf(stderr, "getsockopt failure");
			perror("getsockopt so_error failure");
			return -1;
		}
		printf("the new socket,the SO_ACCEPTCONN: %d\n", conn);
		//sleep(10);
		fprintf(stderr, "being close fd\n");
		close(newsockfd);
		fprintf(stderr, "after close fd : close return \n");


		pause();
	}

	return 0;
}
