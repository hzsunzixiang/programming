#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>

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



	// typedef uint32_t in_addr_t;
	// struct in_addr
	//   {
	//     in_addr_t s_addr;
	//   };


   // int inet_pton(int af, const char *src, void *dst);
   // RETURN VALUE
   // inet_pton() returns 1 on success (network address was successfully converted).  0 is returned if src  does  not  contain  a
   // character  string  representing  a  valid  network address in the specified address family.  If af does not contain a valid
   // address family, -1 is returned and errno is set to EAFNOSUPPORT.

	// void指针 以下两种都可以
	//if (inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0)
	if (inet_pton(AF_INET, argv[1], &servaddr.sin_addr.s_addr) <= 0)
	{
		perror("inet_pton failure!");
		printf("address:%u\n", servaddr.sin_addr.s_addr);
		exit(EXIT_FAILURE);
	}
	printf("success address:%u\n", servaddr.sin_addr.s_addr);

    // const char *inet_ntop(int af, const void *src, char *dst, socklen_t size);
	// RETURN VALUE
    // On success, inet_ntop() returns a non-NULL pointer to dst.  NULL is returned if there was an error, with errno set to indi‐
    //cate the error.
	char str[128];
	//if (inet_ntop(AF_INET, &servaddr.sin_addr, str, sizeof(str)) == NULL)
	if (inet_ntop(AF_INET, &servaddr.sin_addr.s_addr, str, sizeof(str)) == NULL)
	{
		perror("inet_aton failure!");
		printf("address:%u\n", servaddr.sin_addr.s_addr);
		exit(EXIT_FAILURE);
	}
	printf("success address:%s\n", str);

	return 0;
}





