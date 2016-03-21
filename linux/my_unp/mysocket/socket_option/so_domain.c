#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>


//SO_DOMAIN (since Linux 2.6.32)
//Retrieves the socket domain as an integer, returning a value such as AF_INET6.  See socket(2) for details.  This soc    ket option is read-only.
//

///usr/include/x86_64-linux-gnu/bits/socket.h
// /* Protocol families.  */
// #define	PF_UNSPEC	0	/* Unspecified.  */
// #define	PF_LOCAL	1	/* Local to host (pipes and file-domain).  */
// #define	PF_UNIX		PF_LOCAL /* POSIX name for PF_LOCAL.  */
// #define	PF_FILE		PF_LOCAL /* Another non-standard name for PF_LOCAL.  */
// #define	PF_INET		2	/* IP protocol family.  */
// #define	PF_AX25		3	/* Amateur Radio AX.25.  */
// #define	PF_IPX		4	/* Novell Internet Protocol.  */
// #define	PF_APPLETALK	5	/* Appletalk DDP.  */
// #define	PF_NETROM	6	/* Amateur radio NetROM.  */
// #define	PF_BRIDGE	7	/* Multiprotocol bridge.  */
// #define	PF_ATMPVC	8	/* ATM PVCs.  */
// #define	PF_X25		9	/* Reserved for X.25 project.  */
// #define	PF_INET6	10	/* IP version 6.  */
// #define	PF_ROSE		11	/* Amateur Radio X.25 PLP.  */
// #define	PF_DECnet	12	/* Reserved for DECnet project.  */
// #define	PF_NETBEUI	13	/* Reserved for 802.2LLC project.  */
// #define	PF_SECURITY	14	/* Security callback pseudo AF.  */
// #define	PF_KEY		15	/* PF_KEY key management API.  */
// #define	PF_NETLINK	16
// #define	PF_ROUTE	PF_NETLINK /* Alias to emulate 4.4BSD.  */
// #define	PF_PACKET	17	/* Packet family.  */
// #define	PF_ASH		18	/* Ash.  */
// #define	PF_ECONET	19	/* Acorn Econet.  */
// #define	PF_ATMSVC	20	/* ATM SVCs.  */
// #define PF_RDS		21	/* RDS sockets.  */
// #define	PF_SNA		22	/* Linux SNA Project */
// #define	PF_IRDA		23	/* IRDA sockets.  */
// #define	PF_PPPOX	24	/* PPPoX sockets.  */
// #define	PF_WANPIPE	25	/* Wanpipe API sockets.  */
// #define PF_LLC		26	/* Linux LLC.  */
// #define PF_CAN		29	/* Controller Area Network.  */
// #define PF_TIPC		30	/* TIPC sockets.  */
// #define	PF_BLUETOOTH	31	/* Bluetooth sockets.  */
// #define	PF_IUCV		32	/* IUCV sockets.  */
// #define PF_RXRPC	33	/* RxRPC sockets.  */
// #define PF_ISDN		34	/* mISDN sockets.  */
// #define PF_PHONET	35	/* Phonet sockets.  */
// #define PF_IEEE802154	36	/* IEEE 802.15.4 sockets.  */
// #define PF_CAIF		37	/* CAIF sockets.  */
// #define PF_ALG		38	/* Algorithm sockets.  */
// #define PF_NFC		39	/* NFC sockets.  */
// #define PF_VSOCK	40	/* vSockets.  */
// #define	PF_MAX		41	/* For now..  */
// 

// #define	PF_INET		2	/* IP protocol family.  */
// root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/socket_option# ./so_domain
// build socket sucess.
// bind socket sucess!
// before listening:the SO_DOMAIN: 2



// /usr/include/x86_64-linux-gnu/bits/socket_type.h
// /* Types of sockets.  */


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
	if (getsockopt(sockfd, SOL_SOCKET, SO_DOMAIN, &conn, &len) <0)
	{
		fprintf(stderr, "getsockopt failure");
		perror("getsockopt so_error failure");
		return -1;
	}
	printf("before listening:the SO_DOMAIN: %d\n", conn);
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
		if (getsockopt(newsockfd, SOL_SOCKET, SO_DOMAIN, &conn, &len) <0)
		{
			fprintf(stderr, "getsockopt failure");
			perror("getsockopt so_error failure");
			return -1;
		}
		printf("the new socket,the SO_DOMAIN: %d\n", conn);
		//sleep(10);
		fprintf(stderr, "being close fd\n");
		close(newsockfd);
		fprintf(stderr, "after close fd : close return \n");
		pause();
	}



	return 0;
}
