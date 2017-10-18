#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>


// 演示O_NONBLOCK 对 pseudo-files locked files 的作用
// O_NONBLOCK 对于 pseudo-files  是有效的

#define ERR_EXIT(m) \
	do \
	{ \
		perror(m); \
		exit(EXIT_FAILURE); \
	} while(0)

void set_flag(int fd, int flags);
void clr_flag(int fd, int flags);

int main(int argc, char *argv[])
{
	char buf[1024] = {0};
	int ret;
	set_flag(0, O_NONBLOCK);
	clr_flag(0, O_NONBLOCK);
	ret = read(0, buf, 1024);
	if (ret == -1)
		ERR_EXIT("read error");

	printf("buf=%s\n", buf);
	return 0;
}

void set_flag(int fd, int flags)
{
	int val;
	val = fcntl(fd, F_GETFL, 0);
	if (val == -1)
                ERR_EXIT("fcntl get flag error");
	val |= flags;
	if (fcntl(fd, F_SETFL, val) < 0)
		ERR_EXIT("fcntl set flag error");
}

void clr_flag(int fd, int flags)
{
	int val;
	val = fcntl(fd, F_GETFL, 0);
	if (val == -1)
                ERR_EXIT("fcntl get flag error");
	val &= ~flags;
	if (fcntl(fd, F_SETFL, val) < 0)
		ERR_EXIT("fcntl set flag error");
}
