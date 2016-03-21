#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>


//   SO_TYPE Gets the socket type as an integer (e.g., SOCK_STREAM).  This socket option is read-only.





// /usr/include/x86_64-linux-gnu/bits/socket_type.h
// /* Types of sockets.  */
// enum __socket_type
// {
//   SOCK_STREAM = 1,		/* Sequenced, reliable, connection-based
// 				   byte streams.  */
// #define SOCK_STREAM SOCK_STREAM
//   SOCK_DGRAM = 2,		/* Connectionless, unreliable datagrams
// 				   of fixed maximum length.  */
// #define SOCK_DGRAM SOCK_DGRAM
//   SOCK_RAW = 3,			/* Raw protocol interface.  */
// #define SOCK_RAW SOCK_RAW
//   SOCK_RDM = 4,			/* Reliably-delivered messages.  */
// #define SOCK_RDM SOCK_RDM
//   SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
// 				   datagrams of fixed maximum length.  */
// #define SOCK_SEQPACKET SOCK_SEQPACKET
//   SOCK_DCCP = 6,		/* Datagram Congestion Control Protocol.  */
// #define SOCK_DCCP SOCK_DCCP
//   SOCK_PACKET = 10,		/* Linux specific way of getting packets
// 				   at the dev level.  For writing rarp and
// 				   other similar things on the user level. */
// #define SOCK_PACKET SOCK_PACKET
// 
//   /* Flags to be ORed into the type parameter of socket and socketpair and
//      used for the flags parameter of paccept.  */
// 
//   SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
// 				   new descriptor(s).  */
// #define SOCK_CLOEXEC SOCK_CLOEXEC
//   SOCK_NONBLOCK = 00004000	/* Atomically mark descriptor(s) as
// 				   non-blocking.  */
// #define SOCK_NONBLOCK SOCK_NONBLOCK
// };
// 

// build socket sucess.
// bind socket sucess!
// before listening:the SO_TYPE: 1   #这里的1 代表 SOCK_STREAM

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
	if (getsockopt(sockfd, SOL_SOCKET, SO_TYPE, &conn, &len) <0)
	{
		fprintf(stderr, "getsockopt failure");
		perror("getsockopt so_error failure");
		return -1;
	}
	printf("before listening:the SO_TYPE: %d\n", conn);
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
		if (getsockopt(newsockfd, SOL_SOCKET, SO_TYPE, &conn, &len) <0)
		{
			fprintf(stderr, "getsockopt failure");
			perror("getsockopt so_error failure");
			return -1;
		}
		printf("the new socket,the SO_TYPE: %d\n", conn);
		//sleep(10);
		fprintf(stderr, "being close fd\n");
		close(newsockfd);
		fprintf(stderr, "after close fd : close return \n");
		pause();
	}



	return 0;
}
