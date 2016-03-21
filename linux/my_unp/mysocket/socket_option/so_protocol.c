#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

// O_PROTOCOL (since Linux 2.6.32) Retrieves the socket protocol as an integer, returning a value such as IPPROTO_SCTP.  See socket(2) for details.  This socket option is read-only.

// /usr/include/linux/in.h
//  /* Standard well-defined IP protocols.  */
//  enum {
//    IPPROTO_IP = 0,		/* Dummy protocol for TCP		*/
//    IPPROTO_ICMP = 1,		/* Internet Control Message Protocol	*/
//    IPPROTO_IGMP = 2,		/* Internet Group Management Protocol	*/
//    IPPROTO_IPIP = 4,		/* IPIP tunnels (older KA9Q tunnels use 94) */
//    IPPROTO_TCP = 6,		/* Transmission Control Protocol	*/
//    IPPROTO_EGP = 8,		/* Exterior Gateway Protocol		*/
//    IPPROTO_PUP = 12,		/* PUP protocol				*/
//    IPPROTO_UDP = 17,		/* User Datagram Protocol		*/
//    IPPROTO_IDP = 22,		/* XNS IDP protocol			*/
//    IPPROTO_DCCP = 33,		/* Datagram Congestion Control Protocol */
//    IPPROTO_RSVP = 46,		/* RSVP protocol			*/
//    IPPROTO_GRE = 47,		/* Cisco GRE tunnels (rfc 1701,1702)	*/
//  
//    IPPROTO_IPV6	 = 41,		/* IPv6-in-IPv4 tunnelling		*/
//  
//    IPPROTO_ESP = 50,            /* Encapsulation Security Payload protocol */
//    IPPROTO_AH = 51,             /* Authentication Header protocol       */
//    IPPROTO_BEETPH = 94,	       /* IP option pseudo header for BEET */
//    IPPROTO_PIM    = 103,		/* Protocol Independent Multicast	*/
//  
//    IPPROTO_COMP   = 108,                /* Compression Header protocol */
//    IPPROTO_SCTP   = 132,		/* Stream Control Transport Protocol	*/
//    IPPROTO_UDPLITE = 136,	/* UDP-Lite (RFC 3828)			*/
//  
//    IPPROTO_RAW	 = 255,		/* Raw IP packets			*/
//    IPPROTO_MAX
//  };
//  

// root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/socket_option# ./so_protocol
// build socket sucess.
// bind socket sucess!
// before listening:the SO_PROTOCOL: 6

//    IPPROTO_TCP = 6,		/* Transmission Control Protocol	*/



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
	if (getsockopt(sockfd, SOL_SOCKET, SO_PROTOCOL, &conn, &len) <0)
	{
		fprintf(stderr, "getsockopt failure");
		perror("getsockopt so_error failure");
		return -1;
	}
	printf("before listening:the SO_PROTOCOL: %d\n", conn);
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
		if (getsockopt(newsockfd, SOL_SOCKET, SO_PROTOCOL, &conn, &len) <0)
		{
			fprintf(stderr, "getsockopt failure");
			perror("getsockopt so_error failure");
			return -1;
		}
		printf("the new socket,the SO_PROTOCOL: %d\n", conn);
		//sleep(10);
		fprintf(stderr, "being close fd\n");
		close(newsockfd);
		fprintf(stderr, "after close fd : close return \n");
		pause();
	}



	return 0;
}
