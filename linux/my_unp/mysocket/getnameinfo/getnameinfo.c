#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include<arpa/inet.h>
#include <netdb.h>

#define BUF_SIZE 500

//strace 查看 其行为
	int
main(int argc, char *argv[])
{
	int  s;
	//struct sockaddr_storage peer_addr;
	struct sockaddr_in peer_addr;
	socklen_t peer_addr_len;

	char host[NI_MAXHOST], service[NI_MAXSERV];


    memset(&peer_addr, 0, sizeof(peer_addr));
    peer_addr.sin_family = AF_INET;
    peer_addr.sin_port = htons(80);
    if (inet_aton(argv[1], &peer_addr.sin_addr) == 0)
    {
		perror("inet_aton error");
		exit(EXIT_FAILURE);
	}
	peer_addr_len = sizeof(struct sockaddr_in);

	//s = getnameinfo((struct sockaddr *) &peer_addr,
	//		peer_addr_len, host, NI_MAXHOST,
	//		service, NI_MAXSERV, NI_NUMERICSERV);

	// from 115.239.211.112:http

	//s = getnameinfo((struct sockaddr *) &peer_addr,
	//		peer_addr_len, host, NI_MAXHOST,
	//		service, NI_MAXSERV, 0);


	// getnameinfo: Name or service not known
	//	root@iZ25ox3a5vlZ:~/programming/linux/my_unp/mysocket/getnameinfo# ./getnameinfo 127.0.0.1
	//		from localhost:http

	//s = getnameinfo((struct sockaddr *) &peer_addr,
	//		peer_addr_len, host, NI_MAXHOST,
	//		service, NI_MAXSERV, NI_NAMEREQD);

	s = getnameinfo((struct sockaddr *) &peer_addr,
			peer_addr_len, host, NI_MAXHOST,
			service, NI_MAXSERV, NI_NOFQDN);

	if (s == 0)
		printf("from %s:%s\n", host, service);
	else
		fprintf(stderr, "getnameinfo: %s\n", gai_strerror(s));

	return 0;

}



//           struct sockaddr *sa;    /* input */
//           socklen_t len;         /* input */
//           char hbuf[NI_MAXHOST], sbuf[NI_MAXSERV];
//
//           if (getnameinfo(sa, len, hbuf, sizeof(hbuf), sbuf,
//                       sizeof(sbuf), NI_NUMERICHOST | NI_NUMERICSERV) == 0)
//               printf("host=%s, serv=%s\n", hbuf, sbuf);
//
//       The following version checks if the socket address has a reverse address mapping.
//
//           struct sockaddr *sa;    /* input */
//           socklen_t len;         /* input */
//           char hbuf[NI_MAXHOST];
//
//           if (getnameinfo(sa, len, hbuf, sizeof(hbuf),
//                       NULL, 0, NI_NAMEREQD))
//               printf("could not resolve hostname");
//           else
//               printf("host=%s\n", hbuf);

