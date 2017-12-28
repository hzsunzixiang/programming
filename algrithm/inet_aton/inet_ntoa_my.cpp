


//https://code.woboq.org/userspace/glibc/inet/inet_ntoa.c.html
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
/* The interface of this function is completely stupid, it requires a
   static buffer.  We relax this a bit in that we allow one buffer for
   each thread.  */
static __thread char buffer[18];
char * inet_ntoa (struct in_addr in)
{
	unsigned char *bytes = (unsigned char *) &in;
	snprintf (buffer, sizeof (buffer), "%d.%d.%d.%d",
			bytes[0], bytes[1], bytes[2], bytes[3]);
	return buffer;
}

char * inet_ntoa_my (uint32_t in, char buffer[])
{
	unsigned char *bytes = (unsigned char *) &in;
	snprintf (buffer, sizeof (buffer), "%d.%d.%d.%d",
			bytes[0], bytes[1], bytes[2], bytes[3]);
	return buffer;
}
int main()
{
	return 0;
}

// /* str长度合法性由调用者保证 */
// void ip_int2str(const unsigned int ip, char str[])
// {
// 	unsigned char *val = (unsigned char *)&ip;
// 	sprintf(str, "%u.%u.%u.%u", val[3], val[2], val[1], val[0]);
// }
