


//https://code.woboq.org/userspace/glibc/inet/inet_ntoa.c.html
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
	/* The interface of this function is completely stupid, it requires a
	   static buffer.  We relax this a bit in that we allow one buffer for
	   each thread.  */
	static __thread char buffer[18];
	char *
inet_ntoa (struct in_addr in)
{
	unsigned char *bytes = (unsigned char *) &in;
	__snprintf (buffer, sizeof (buffer), "%d.%d.%d.%d",
			bytes[0], bytes[1], bytes[2], bytes[3]);
	return buffer;
}
// 参看文件inet_aton_my.cpp
int main()
{
	return 0;
}
