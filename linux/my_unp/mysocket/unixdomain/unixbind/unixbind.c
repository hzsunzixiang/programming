
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/un.h>
#include <sys/socket.h>

// stephensun@debian:~/programming/linux/my_unp/mysocket/unixdomain$ ./unixbind  /tmp/test
// bound name = /tmp/test, returned len = 12
// stephensun@debian:~/programming/linux/my_unp/mysocket/unixdomain$ ll /tmp/test -lh
// srwxr-xr-x 1 stephensun root 0 Mar 14 20:46 /tmp/test

// /* Structure describing the address of an AF_LOCAL (aka AF_UNIX) socket.  */
// struct sockaddr_un
//   {
//     __SOCKADDR_COMMON (sun_);  // 两个字节
//     char sun_path[108];		/* Path name.  */
//   };

// struct sockaddr_un
//   {
//     sa_family_t sun_family;
//     char sun_path[108];
//   };
// typedef unsigned short int sa_family_t;

#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)

#define SA struct sockaddr
	int
main(int argc, char **argv)
{
	int					sockfd;
	socklen_t			len;
	struct sockaddr_un	addr1, addr2;

	if (argc != 2)
		err_quit("usage: unixbind <pathname>");

 	// sockfd = socket(1, SOCK_STREAM, 0);
	// strace 看到  socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 3

	if ((sockfd= socket(AF_INET, SOCK_STREAM, 0)) == -1) {
		perror("socket");
		return -1;
	}
	printf("sizeof(struct sockaddr_un):%ld\n", sizeof(struct sockaddr_un));

	unlink(argv[1]);		/* OK if this fails */

	bzero(&addr1, sizeof(addr1));
	addr1.sun_family = AF_LOCAL;
	strncpy(addr1.sun_path, argv[1], sizeof(addr1.sun_path)-1);
	//bind(sockfd, (SA *) &addr1, SUN_LEN(&addr1));
	if(bind(sockfd, (SA *) &addr1, SUN_LEN(&addr1)) < 0)
	{
		perror("bind");
		return -1;
	}

	///* Evaluate to actual length of the `sockaddr_un' structure.  */
	// # define SUN_LEN(ptr) ((size_t) (((struct sockaddr_un *) 0)->sun_path) + strlen ((ptr)->sun_path))
 	// bind(sockfd, (struct sockaddr *) &addr1, ((size_t) (((struct sockaddr_un *) 0)->sun_path) + strlen ((&addr1)->sun_path)));

	len = sizeof(addr2);
	if(getsockname(sockfd, (SA *) &addr2, &len) < 0)
	{
		perror("getsockname");
		return -1;
	}


	printf("bound name = %s, returned len = %d\n", addr2.sun_path, len);

	exit(0);
}
