#include <stdio.h>


// http://blog.csdn.net/thisinnocence/article/details/61937160 
// http://blog.csdn.net/hityct1/article/details/3861205
// http://blog.csdn.net/wzy_1988/article/details/13091227

/* ip 字符串合法性由调用者保证 */
unsigned int ip_str2int(const char* ip)
{
	unsigned int re = 0;
	unsigned char tmp = 0;
	while (1) {
		if (*ip != '\0' && *ip != '.') {
			tmp = tmp * 10 + *ip - '0';
		} else {
			re = (re << 8) + tmp;
			if (*ip == '\0')
				break;
			tmp = 0;
		}
		ip++;
	}
	return re;
}

/* str长度合法性由调用者保证 */
void ip_int2str(const unsigned int ip, char str[])
{
	unsigned char *val = (unsigned char *)&ip;
	sprintf(str, "%u.%u.%u.%u", val[3], val[2], val[1], val[0]);
}

int main()
{
	const char *ip1 = "192.168.1.1";
	unsigned int res = 0;
	res = ip_str2int(ip1);
	printf("%u\n", res);

	return 0;
}
