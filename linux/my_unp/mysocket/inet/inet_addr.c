#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>

// /* Address to accept any incoming messages.  */
// #define	INADDR_ANY		((in_addr_t) 0x00000000)
// /* Address to send to all hosts.  */
// #define	INADDR_BROADCAST	((in_addr_t) 0xffffffff)
// /* Address indicating an error return.  */
// #define	INADDR_NONE		((in_addr_t) 0xffffffff)
// 
// /* Network number for local host loopback.  */
// #define	IN_LOOPBACKNET		127
// /* Address to loopback in software to local host.  */
// #ifndef INADDR_LOOPBACK
// # define INADDR_LOOPBACK	((in_addr_t) 0x7f000001) /* Inet 127.0.0.1.  */
// #endif
// 
// /* Defines for Multicast INADDR.  */
// #define INADDR_UNSPEC_GROUP	((in_addr_t) 0xe0000000) /* 224.0.0.0 */
// #define INADDR_ALLHOSTS_GROUP	((in_addr_t) 0xe0000001) /* 224.0.0.1 */
// #define INADDR_ALLRTRS_GROUP    ((in_addr_t) 0xe0000002) /* 224.0.0.2 */
// #define INADDR_MAX_LOCAL_GROUP  ((in_addr_t) 0xe00000ff) /* 224.0.0.255 */

// /* Internet address.  */
// typedef uint32_t in_addr_t;
// struct in_addr
//   {
//     in_addr_t s_addr;
//   };

//typedef uint16_t in_port_t;

// /* Structure describing an Internet socket address.  */
// struct sockaddr_in
//   {
//     __SOCKADDR_COMMON (sin_);
//     in_port_t sin_port;			/* Port number.  */
//     struct in_addr sin_addr;		/* Internet address.  */
// 
//     /* Pad to size of `struct sockaddr'.  */
//     unsigned char sin_zero[sizeof (struct sockaddr) -
// 			   __SOCKADDR_COMMON_SIZE -
// 			   sizeof (in_port_t) -
// 			   sizeof (struct in_addr)];
//   };
// 
// 预编译之后的结果
// struct sockaddr_in
//   {
//     sa_family_t sin_family;
//     in_port_t sin_port;
//     struct in_addr sin_addr;
// 
// 
//     unsigned char sin_zero[sizeof (struct sockaddr) -
//       (sizeof (unsigned short int)) -
//       sizeof (in_port_t) -
//       sizeof (struct in_addr)];
//   };

// struct sockaddr
//   {
//     sa_family_t sa_family;
//     char sa_data[14];
//   };
// struct sockaddr_storage
//   {
//     sa_family_t ss_family;
//     unsigned long int __ss_align;
//     char __ss_padding[(128 - (2 * sizeof (unsigned long int)))];
//   };


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
	if(argv[1] == NULL)
	{
		//argv[1] = "0.0.0.0";
		argv[1] = "127.0.0.1";
		//argv[1] = "255.255.255.255";
	}


	// sizeof(struct sockaddr):16, sizeof(struct sockaddr_in):16, sizeof(struct sockaddr_storage):128
	printf("sizeof(struct sockaddr):%ld, sizeof(struct sockaddr_in):%ld, sizeof(struct sockaddr_storage):%ld\n", 
			sizeof(struct sockaddr),
			sizeof(struct sockaddr_in),
			sizeof(struct sockaddr_storage));

	// typedef uint32_t in_addr_t;
	// struct in_addr
	//   {
	//     in_addr_t s_addr;
	//   };

	// int inet_aton(const char *cp, struct in_addr *inp);
	// 很特别 返回 0 表示错误
	// inet_aton() returns 1 if the supplied string was successfully interpreted, or 0 if the string is invalid (errno is not set on error).

	/* Convert Internet host address from numbers-and-dots notation in CP
	   into binary data and store the result in the structure INP.  */
	// extern int inet_aton (const char *__cp, struct in_addr *__inp) __THROW;

	// The inet_addr() function converts the Internet host address cp from IPv4 numbers-and-dots notation into binary data in network byte order.  If the input is  invalid,  INADDR_NONE
	// (usually  -1)  is  returned.  Use of this function is problematic because -1 is a valid address (255.255.255.255).  Avoid its use in favor of inet_aton(), inet_pton(3), or getad‐
	// drinfo(3), which provide a cleaner way to indicate error return.

	// in_addr_t inet_addr(const char *cp);
	
	//if ( (servaddr.sin_addr.s_addr = inet_addr(argv[1])) < 0)
	if ( (servaddr.sin_addr.s_addr = inet_addr(argv[1])) == INADDR_NONE)
	{
		//perror("inet_aton failure!\n");
		//printf("address:%u\n", servaddr.sin_addr.s_addr);
		printf("inet_addr failure\n");
		exit(EXIT_FAILURE);
	}
	printf("success address:0x%x\n", servaddr.sin_addr.s_addr);


	return 0;
}





