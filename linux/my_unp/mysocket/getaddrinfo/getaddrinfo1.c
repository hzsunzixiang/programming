#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <netdb.h>

#define BUF_SIZE 500

	int
main(int argc, char *argv[])
{
	struct addrinfo hints;
	struct addrinfo *result, *rp;
	int sfd, s;
	struct sockaddr_storage peer_addr;
	socklen_t peer_addr_len;
	ssize_t nread;
	char buf[BUF_SIZE];

	if (argc != 2) {
		fprintf(stderr, "Usage: %s port\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	memset(&hints, 0, sizeof(struct addrinfo));
	hints.ai_family = AF_UNSPEC;    /* Allow IPv4 or IPv6 */
	hints.ai_socktype = SOCK_DGRAM; /* Datagram socket */
	hints.ai_flags = AI_PASSIVE;    /* For wildcard IP address */
	hints.ai_protocol = 0;          /* Any protocol */
	hints.ai_canonname = NULL;
	hints.ai_addr = NULL;
	hints.ai_next = NULL;

	s = getaddrinfo(NULL, argv[1], &hints, &result);
	if (s != 0) {
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
		exit(EXIT_FAILURE);
	}

	/* getaddrinfo() returns a list of address structures.
	   Try each address until we successfully bind(2).
	   If socket(2) (or bind(2)) fails, we (close the socket
	   and) try the next address. */

	//for (rp = result; rp != NULL; rp = rp->ai_next) {
	//	sfd = socket(rp->ai_family, rp->ai_socktype,
	//			rp->ai_protocol);
	//	if (sfd == -1)
	//		continue;

	//	if (bind(sfd, rp->ai_addr, rp->ai_addrlen) == 0)
	//		break;                  /* Success */

	//	close(sfd);
	//}

	//if (rp == NULL) {               /* No address succeeded */
	//	fprintf(stderr, "Could not bind\n");
	//	exit(EXIT_FAILURE);
	//}

	printf("here  will free\n");
	freeaddrinfo(result);           /* No longer needed */
	pause();


}


// stephensun@debian:~/programming/linux/my_unp/mysocket/getaddrinfo$ ltrace ./getaddrinfo1  6666
// __libc_start_main(0x400876, 2, 0x7fff9e3c53a8, 0x400a30 <unfinished ...>
// memset(0x7fff9e3c5280, '\0', 48)                                                                                     = 0x7fff9e3c5280
// getaddrinfo(nil, "6666", 0x7fff9e3c5280, 0x7fff9e3c5278)                                                             = 0
// socket(2, 2, 17)                                                                                                     = 3
// bind(3, 0x22f50a0, 16, 0x22f50a0)                                                                                    = 0
// puts("here  will free"here  will free
// )                                                                                              = 16
// freeaddrinfo(0x22f5070)                                                                                              = <void>
// pause(0, 0xffffffff, 0x7f2650c06648, 0




// socket(PF_NETLINK, SOCK_RAW, NETLINK_ROUTE) = 3
// bind(3, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
// getsockname(3, {sa_family=AF_NETLINK, pid=13287, groups=00000000}, [12]) = 0
// sendto(3, "\24\0\0\0\26\0\1\3\243\275\5W\0\0\0\0\0\0\0\0", 20, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 20
// recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"L\0\0\0\24\0\2\0\243\275\5W\3473\0\0\2\10\200\376\1\0\0\0\10\0\1\0\177\0\0\1"..., 4096}], msg_controllen=0, msg_flags=0}, 0) = 164
// recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"H\0\0\0\24\0\2\0\243\275\5W\3473\0\0\n\200\200\376\1\0\0\0\24\0\1\0\0\0\0\0"..., 4096}], msg_controllen=0, msg_flags=0}, 0) = 144
// recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"\24\0\0\0\3\0\2\0\243\275\5W\3473\0\0\0\0\0\0", 4096}], msg_controllen=0, msg_flags=0}, 0) = 20
// socket(PF_LOCAL, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 4
// connect(4, {sa_family=AF_LOCAL, sun_path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
// close(4)                                = 0
// close(3)                                = 0
// socket(PF_INET6, SOCK_DGRAM, IPPROTO_IP) = 3
// connect(3, {sa_family=AF_INET6, sin6_port=htons(6666), inet_pton(AF_INET6, "::", &sin6_addr), sin6_flowinfo=0, sin6_scope_id=0}, 28) = 0
// getsockname(3, {sa_family=AF_INET6, sin6_port=htons(47526), inet_pton(AF_INET6, "::1", &sin6_addr), sin6_flowinfo=0, sin6_scope_id=0}, [28]) = 0
// connect(3, {sa_family=AF_UNSPEC, sa_data="\0\0\0\0\0\0\0\0\0\0\0\0\0\0"}, 16) = 0
// connect(3, {sa_family=AF_INET, sin_port=htons(6666), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
// getsockname(3, {sa_family=AF_INET6, sin6_port=htons(47450), inet_pton(AF_INET6, "::ffff:127.0.0.1", &sin6_addr), sin6_flowinfo=0, sin6_scope_id=0}, [28]) = 0
// close(3)                                = 0
// fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 5), ...}) = 0
// mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7ff804149000

