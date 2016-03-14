#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>


int main(int argc, char **argv) {
	if (argc < 2) {
		printf("Usage: %s hostname\n", argv[0]);
		exit(-1);
	}

	struct hostent *hp = gethostbyname(argv[1]);

	if (hp == NULL) {
		printf("gethostbyname() failed\n");
	} else {
		printf("hp->h_name:%s = \n", hp->h_name);
		unsigned int i=0;
		while ( hp -> h_addr_list[i] != NULL) {
			printf( "%s ", inet_ntoa( *( struct in_addr*)( hp -> h_addr_list[i])));
			i++;
		}
		printf("\n");
	}
	return 0;
}
// gethostbyname differs from the other socket functions that we have described in that it does not set errno when an error occurs. Instead, it sets the global integer h_errno to one of the following constants defined by including <netdb.h>:
// 
//     HOST_NOT_FOUND
// 
//     TRY_AGAIN
// 
//     NO_RECOVERY
// 
//     NO_DATA (identical to NO_ADDRESS)
// 
// The NO_DATA error means the specified name is valid, but it does not have an A record. An example of this is a hostname with only an MX record.
// 
// Most modern resolvers provide the function hstrerror, which takes an h_errno value as its only argument and returns a const char * pointer to a description of the error. We show some examples of the strings returned by this function in the next example.

// /* Possible values left in `h_errno'.  */
// # define HOST_NOT_FOUND	1	/* Authoritative Answer Host not found.  */
// # define TRY_AGAIN	2	/* Non-Authoritative Host not found,
// 				   or SERVERFAIL.  */
// # define NO_RECOVERY	3	/* Non recoverable errors, FORMERR, REFUSED,
// 				   NOTIMP.  */
// # define NO_DATA	4	/* Valid name, no data record of requested
// 				   type.  */
