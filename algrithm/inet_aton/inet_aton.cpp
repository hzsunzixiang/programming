#include	<sys/types.h>
#include	<netinet/in.h>  // htonl

#include <stdio.h>


// http://www.cs.cmu.edu/afs/cs/academic/class/15213-f00/unpv12e/libfree/inet_aton.c
// http://mirror.fsf.org/pmon2000/3.x/src/lib/libc/inet_addr.c
/* 
 * Check whether "cp" is a valid ascii representation
 * of an Internet address and convert to a binary address.
 * Returns 1 if the address is valid, 0 if not.
 * This replaces inet_addr, the return value from which
 * cannot distinguish between failure and a local broadcast address.
 */


// /* Internet address.  */
// typedef uint32_t in_addr_t;
// struct in_addr
// {
// 	in_addr_t s_addr;
// };

	int
inet_aton(const char *cp, struct in_addr *ap)
{
	int dots = 0;
	register u_long acc = 0, addr = 0;

	do {
		register char cc = *cp;

		switch (cc) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				acc = acc * 10 + (cc - '0');
				break;

			case '.':
				if (++dots > 3) {
					return 0;
				}
				/* Fall through */

			case '\0':
				if (acc > 255) {
					return 0;
				}
				addr = addr << 8 | acc;
				acc = 0;
				break;

			default:
				return 0;
		}
	} while (*cp++) ;

	/* Normalize the address */
	if (dots < 3) {
		addr <<= 8 * (3 - dots) ;
	}

	/* Store it if requested */
	if (ap) {
		ap->s_addr = htonl(addr);
	}

	return 1;    
}

	int
inet_aton_my(const char *cp, unsigned int *ap)
{
	int dots = 0;
	register u_long acc = 0, addr = 0;

	do {
		register char cc = *cp;

		switch (cc) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				acc = acc * 10 + (cc - '0');
				break;

			case '.':
				if (++dots > 3) {
					return 0;
				}
				/* Fall through */  // 这里没有break 往下走

			case '\0':
				if (acc > 255) {
					return 0;
				}
				addr = addr << 8 | acc;
				acc = 0;
				break;

			default:
				return 0;
		}
	} while (*cp++) ;

	/* Normalize the address */
	if (dots < 3) {
		//addr <<= 8 * (3 - dots) ;
		addr = addr << (8 * (3 - dots)) ;
	}

	/* Store it if requested */
	if (ap) {
		*ap = htonl(addr);
	}

	return 1;    
}


int main()
{
	//const char *ip1 = "192.168.1.1";
	const char *ip1 = "192.168.1";
	unsigned int res = 0;
	inet_aton_my(ip1, &res);
	printf("%d\n", res);
	struct in_addr addr;
	inet_aton(ip1, &addr);
	printf("%d\n", addr.s_addr);

	return 0;
}
