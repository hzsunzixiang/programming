/* include tcp_connect */
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/un.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

// strace 跟踪

#define SA struct sockaddr
#define MAXLINE 1024
#define max(x,y) ((x) > (y) ? (x) : (y))
#define UNIXSTR_PATH "/tmp/test"
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_sys(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)

char * Sock_ntop_host(const struct sockaddr *sa, socklen_t salen);
char * sock_ntop_host(const struct sockaddr *sa, socklen_t salen);
int tcp_connect(const char *host, const char *serv);
	int
main(int argc, char **argv)
{
	int				sockfd, n;
	char			recvline[MAXLINE + 1];
	socklen_t		len;
	struct sockaddr_storage	ss;

	if (argc != 3)
		err_quit("usage: daytimetcpcli <hostname/IPaddress> <service/port#>");

	sockfd = tcp_connect(argv[1], argv[2]);

	len = sizeof(ss);
	getpeername(sockfd, (SA *)&ss, &len);
	printf("connected to %s\n", Sock_ntop_host((SA *)&ss, len));

	while (1) {
		n = read(sockfd, recvline, MAXLINE);
		if(n > 0)
		{
			recvline[n] = 0;	/* null terminate */
			fputs(recvline, stdout);
		}
		else if(n < 0)
		{
			err_quit("response error");
		}
		else
		{
			err_quit("finish");
		}

	}
	exit(0);
}
	int
tcp_connect(const char *host, const char *serv)
{
	int				sockfd, n;
	struct addrinfo	hints, *res, *ressave;

	bzero(&hints, sizeof(struct addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	if ( (n = getaddrinfo(host, serv, &hints, &res)) != 0)
	{

		char tmp[128];
		sprintf(tmp, "tcp_connect error for %s, %s: %s", host, serv, gai_strerror(n) );
		err_quit(tmp);
	}
	ressave = res;

	do {
		sockfd = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
		if (sockfd < 0)
			continue;	/* ignore this one */

		if (connect(sockfd, res->ai_addr, res->ai_addrlen) == 0)
			break;		/* success */

		close(sockfd);	/* ignore this one */
	} while ( (res = res->ai_next) != NULL);

	if (res == NULL)	/* errno set from final connect() */
	{
		char tmp[128];

		snprintf(tmp, sizeof(tmp),  "tcp_connect error for %s, %s", host, serv);
		err_sys(tmp);
	}

	freeaddrinfo(ressave);

	return(sockfd);
}
/* end tcp_connect */

	char *
sock_ntop_host(const struct sockaddr *sa, socklen_t salen)
{
	static char str[128];		/* Unix domain is largest */

	switch (sa->sa_family) {
		case AF_INET: {
						  struct sockaddr_in	*sin = (struct sockaddr_in *) sa;

						  if (inet_ntop(AF_INET, &(sin->sin_addr), str, sizeof(str)) == NULL)
							  return(NULL);
						  return(str);
					  }

#ifdef	IPV6
		case AF_INET6: {
						   struct sockaddr_in6	*sin6 = (struct sockaddr_in6 *) sa;

						   if (inet_ntop(AF_INET6, &sin6->sin6_addr, str, sizeof(str)) == NULL)
							   return(NULL);
						   return(str);
					   }
#endif

#ifdef	AF_UNIX
		case AF_UNIX: {
						  struct sockaddr_un	*unp = (struct sockaddr_un *) sa;

						  /* OK to have no pathname bound to the socket: happens on
							 every connect() unless client calls bind() first. */
						  if (unp->sun_path[0] == 0)
							  strcpy(str, "(no pathname bound)");
						  else
							  snprintf(str, sizeof(str), "%s", unp->sun_path);
						  return(str);
					  }
#endif

#ifdef	HAVE_SOCKADDR_DL_STRUCT
		case AF_LINK: {
						  struct sockaddr_dl	*sdl = (struct sockaddr_dl *) sa;

						  if (sdl->sdl_nlen > 0)
							  snprintf(str, sizeof(str), "%*s",
									  sdl->sdl_nlen, &sdl->sdl_data[0]);
						  else
							  snprintf(str, sizeof(str), "AF_LINK, index=%d", sdl->sdl_index);
						  return(str);
					  }
#endif
		default:
					  snprintf(str, sizeof(str), "sock_ntop_host: unknown AF_xxx: %d, len %d",
							  sa->sa_family, salen);
					  return(str);
	}
	return (NULL);
}

	char *
Sock_ntop_host(const struct sockaddr *sa, socklen_t salen)
{
	char	*ptr;

	if ( (ptr = sock_ntop_host(sa, salen)) == NULL)
		err_sys("sock_ntop_host error");	/* inet_ntop() sets errno */
	return(ptr);
}
