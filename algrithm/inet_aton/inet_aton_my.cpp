#include	<sys/types.h>
#include	<netinet/in.h>  // htonl
#include <sys/socket.h>
#include <arpa/inet.h>


#include <stdio.h>



int inet_aton_my(const char *cp, uint32_t *ap)
{
	/** 支持形式 
	  192.168.1.1
	  192.168.1.
	  192.168.1
	  192.168.
	  192.168
	  192.
	  192
	 **/
	int dots = 0;
	uint32_t acc = 0;
	uint32_t addr = 0;
	do
	{
		char cc = *cp;
		switch(cc)
		{
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
				acc = 10 * acc + *cp - '0';
				if (acc > 255)
				{
					return 0;
				}
				break;  // 接着循环
			case '.':  // 碰到. 号 或者 '\0' 统一处理
				if(++dots > 3) 
					return 0;
				// fall through  继续往下走
			case '\0':
				addr = (addr<<8) + acc;
				acc = 0;   // 注意这里会清空
				break;
			default:
				return 0;
		}

	}while(*cp++);
	
	if (dots < 3)
	{
		addr = addr<< (8 * (3-dots));
	}
	if (ap)
	{
		*ap = htonl(addr);
	}


	return 1;
}

int main()
{
	//const char *ip1 = "192.168.1.1";
	//const char *ip1 = "192.168.1.";
	const char *ip1 = "192.168.1";   // 跟标准的有些不一致
	uint32_t res = 0;

	struct in_addr addr;
	if (inet_aton_my(ip1, &res) == 0)
	{
 		fprintf(stderr, "Invalid address:%s\n", ip1);
	}
	else
	{
		addr.s_addr = res;
 		printf("res:%u, %s\n", res, inet_ntoa(addr));
	}
	//inet_aton(ip1, &addr);   // 由于里面调用了htonl 所以很难 比较
	struct in_addr addr1;
 	if (inet_aton(ip1, &addr1) == 0) {
 		fprintf(stderr, "Invalid address\n");
 	}
	else
	{
 		printf("res:%u, %s\n", addr1.s_addr, inet_ntoa(addr1));
	}
 
	return 0;
}



// main(int argc, char *argv[])
// {
// 	struct in_addr addr;
// 
// 	if (argc != 2) {
// 		fprintf(stderr, "%s <dotted-address>\n", argv[0]);
// 		exit(EXIT_FAILURE);
// 	}
// 
// 	if (inet_aton(argv[1], &addr) == 0) {
// 		fprintf(stderr, "Invalid address\n");
// 		exit(EXIT_FAILURE);
// 	}
// 
// 	printf("%s\n", inet_ntoa(addr));
// 	exit(EXIT_SUCCESS);
// }

