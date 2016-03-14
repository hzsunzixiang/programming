#include <stdio.h>
#include <netdb.h>


int main(int argc, char *argv[])
{
	//struct hostent *lh = gethostbyname("localhost");

	//  IPAddress     Hostname    		 Alias
	//  127.0.0.1	localhost szx-test-host

	struct hostent *lh = gethostbyname("szx-test-host1");
	//struct hostent *lh = gethostbyname("www.baidu.com");  // www.a.shifen.com

	if (lh)
		puts(lh->h_name);
	else
		herror("gethostbyname");  // gethostbyname: Host name lookup failure

	return 0;
}
// /* Possible values left in `h_errno'.  */
// # define HOST_NOT_FOUND	1	/* Authoritative Answer Host not found.  */
// # define TRY_AGAIN	2	/* Non-Authoritative Host not found,
// 				   or SERVERFAIL.  */
// # define NO_RECOVERY	3	/* Non recoverable errors, FORMERR, REFUSED,
// 				   NOTIMP.  */
// # define NO_DATA	4	/* Valid name, no data record of requested
//				   type.  */
