#include <stdio.h>
#include <stdlib.h>
#include <netdb.h>
#include <arpa/inet.h>

#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
int
main(int argc, char **argv)
{
	char			*ptr, **pptr;
	char			str[INET6_ADDRSTRLEN];
	struct hostent	*hptr;
	struct hostent	*hptr1;
	char tmp[128];

	while (--argc > 0) {
		ptr = *++argv;
		if ( (hptr = gethostbyname(ptr)) == NULL) {
			snprintf(tmp, sizeof(tmp), "gethostbyname error for host: %s: %s", ptr, hstrerror(h_errno));
			perror(tmp);
			continue;
		}
		printf("official hostname: %s\n", hptr->h_name);

		for (pptr = hptr->h_aliases; *pptr != NULL; pptr++)
			printf("	alias: %s\n", *pptr);

		switch (hptr->h_addrtype) {
		case AF_INET:
#ifdef	AF_INET6
		case AF_INET6:
#endif

			pptr = hptr->h_addr_list;
			for ( ; *pptr != NULL; pptr++) {
				char const * tmp;

				if((tmp = inet_ntop(hptr->h_addrtype, *pptr, str, sizeof(str))))
				{
					printf("\taddress: %s\n", tmp);
				}
				else 
				{
					err_msg("inet_ntop");
				}


				// 注意这里可能是空 导致程序hptr1为空 如果 是htpr 则直接错误了
				if ( (hptr1 = gethostbyaddr(*pptr, hptr->h_length,
								hptr->h_addrtype)) == NULL)
					printf("\t(gethostbyaddr failed)\n");
				else if (hptr->h_name != NULL)
					printf("\tname = %s\n", hptr->h_name);
				else
					printf("\t(no hostname returned by gethostbyaddr)\n");
			}
			break;

		default:
			err_msg("unknown address type");
			break;
		}
	}
	exit(0);
}
