#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>

#define ERR_EXIT(m) \
        do  {  perror(m);  exit(EXIT_FAILURE);  } while(0)

struct test
{
	short s1;
	short s2;
	short s3;
	short s4;
	short s5;
};

int main(void)
{
	int ret;
	int send_fd;
	struct msghdr msg;
	struct cmsghdr *p_cmsg;
	struct iovec vec;
	char cmsgbuf[CMSG_SPACE(sizeof(send_fd))];
	int *p_fds;
	char sendchar = 0;
	msg.msg_control = cmsgbuf;
	msg.msg_controllen = sizeof(cmsgbuf);
	p_cmsg = CMSG_FIRSTHDR(&msg);
	p_cmsg->cmsg_level = SOL_SOCKET;
	p_cmsg->cmsg_type = SCM_RIGHTS;
	p_cmsg->cmsg_len = CMSG_LEN(sizeof(send_fd));
	p_fds = (int*)CMSG_DATA(p_cmsg);
	
	// CMSG_SPACE(sizeof(send_fd)):24, CMSG_LEN(sizeof(send_fd)):20, sizeof(struct test) :10, sizeof(control_un.cmsgbuf):24

	// 用来验证对齐时的行为
	union
	{
		struct test  t;
		char cmsgbuf[CMSG_SPACE(sizeof(send_fd))];
	}control_un;
	printf("CMSG_SPACE(sizeof(send_fd)):%lu, CMSG_LEN(sizeof(send_fd)):%lu, sizeof(struct test) :%lu, sizeof(control_un.cmsgbuf):%lu\n", 
			CMSG_SPACE(sizeof(send_fd)), CMSG_LEN(sizeof(send_fd)), sizeof(struct test), sizeof(control_un.cmsgbuf));



}


