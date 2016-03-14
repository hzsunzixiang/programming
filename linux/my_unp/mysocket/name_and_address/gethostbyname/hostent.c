//http://www.masterraghu.com/subjects/np/introduction/unix_network_programming_v1.3/ch11lev1sec3.html
#include <stdio.h>
#include <stdlib.h>
#include <netdb.h>
#include <arpa/inet.h>


#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)

//         struct hostent {
//                char  *h_name;            /* official name of host */
//                char **h_aliases;         /* alias list */
//                int    h_addrtype;        /* host address type */
//                int    h_length;          /* length of address */
//                char **h_addr_list;       /* list of addresses */
//            }
// 
int
main(int argc, char **argv)
{
	char			*ptr, **pptr;
	// /usr/include/netinet/in.h:#define INET_ADDRSTRLEN 16
	char			str[INET_ADDRSTRLEN];
	struct hostent	*hptr;

	char tmp[128];
	while (--argc > 0) {
		ptr = *++argv;
		if ( (hptr = gethostbyname(ptr)) == NULL) {
			// gethostbyname error for host: baiduxxx: Host name lookup failure: Resource temporarily unavailable
			snprintf(tmp, sizeof(tmp), "gethostbyname error for host: %s: %s", ptr, hstrerror(h_errno));
			err_msg(tmp);
			continue;
		}
		printf("official hostname: %s\n", hptr->h_name);

		for (pptr = hptr->h_aliases; *pptr != NULL; pptr++)
			printf("\talias: %s\n", *pptr);

		switch (hptr->h_addrtype) {
		case AF_INET:
			pptr = hptr->h_addr_list;
			for ( ; *pptr != NULL; pptr++)
       						// const char *inet_ntop(int af, const void *src, char *dst, socklen_t size);
				printf("\taddress: %s\n",
					inet_ntop(hptr->h_addrtype, *pptr, str, sizeof(str)));
			break;

		default:
			err_msg("unknown address type");
			break;
		}
	}
	exit(0);
}
// stephensun@debian:~/programming/linux/my_unp/mysocket/name_and_address/gethostbyname$ ./hostent baidu.com localhost
// official hostname: baidu.com
//         address: 123.125.114.144
//         address: 180.149.132.47
//         address: 220.181.57.217
//         address: 111.13.101.208
// official hostname: localhost
//         alias: szx-test-host
//         alias: ip6-localhost
//         alias: ip6-loopback
//         address: 127.0.0.1
//         address: 127.0.0.1
// 
// stephensun@debian:~/programming/linux/my_unp/mysocket/name_and_address/gethostbyname$ cat /etc/hosts
// 127.0.0.1       localhost szx-test-host
// 127.0.1.1       debian
// 
// # The following lines are desirable for IPv6 capable hosts
// ::1     localhost ip6-localhost ip6-loopback
// ff02::1 ip6-allnodes
// ff02::2 ip6-allrouters

// stephensun@debian:~/programming/linux/my_unp/mysocket/name_and_address/gethostbyname$ ./hostent baidu.com szx-test-host
// official hostname: baidu.com
//         address: 111.13.101.208
//         address: 123.125.114.144
//         address: 180.149.132.47
//         address: 220.181.57.217
// official hostname: localhost
//         alias: szx-test-host
//         address: 127.0.0.1

