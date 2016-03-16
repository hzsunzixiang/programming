#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>

// #define INET_ADDRSTRLEN 16
// #define INET6_ADDRSTRLEN 46
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

	
	if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
	{
		perror("inet_aton failure!");
		printf("address:%u\n", servaddr.sin_addr.s_addr);
		exit(EXIT_FAILURE);
	}
	printf("success address:%u\n", servaddr.sin_addr.s_addr);

	char strptr[INET_ADDRSTRLEN];
   	//    const char *inet_ntop(int af, const void *src, char *dst, socklen_t size);
	if(inet_ntop(AF_INET, ar, char *dst, socklen_t size))
	{
	}
/* include inet_ntop */
const char *
inet_ntop(int family, const void *addrptr, char *strptr, size_t len)
{
	const u_char *p = (const u_char *) addrptr;

	if (family == AF_INET) {
		char	temp[INET_ADDRSTRLEN];

		snprintf(temp, sizeof(temp), "%d.%d.%d.%d",
				 p[0], p[1], p[2], p[3]);
		if (strlen(temp) >= len) {
			errno = ENOSPC;
			return (NULL);
		}
		strcpy(strptr, temp);
		return (strptr);
	}
	errno = EAFNOSUPPORT;
	return (NULL);
}


	return 0;
}





