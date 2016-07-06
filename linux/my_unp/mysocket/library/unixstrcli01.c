#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/un.h>
#include <sys/socket.h>


// strace 跟踪
// socket(PF_LOCAL, SOCK_STREAM, 0)        = 3
// connect(3, {sa_family=AF_LOCAL, sun_path="/tmp/test"}, 110) = 0

#define SA struct sockaddr
#define max(x,y) ((x) > (y) ? (x) : (y))
#define UNIXSTR_PATH "/tmp/test"
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)

void str_cli(FILE *fp, int sockconn);
int
main(int argc, char **argv)
{
	int					sockfd;
	struct sockaddr_un	servaddr;

	if((sockfd = socket(AF_LOCAL, SOCK_STREAM, 0)) < 0)
	{
		perror("socket");
		return -1;
	}

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sun_family = AF_LOCAL;
	strcpy(servaddr.sun_path, UNIXSTR_PATH);

	if(connect(sockfd, (SA *) &servaddr, sizeof(servaddr)) < 0)
	{
		perror("socket");
		return -1;
	}

	str_cli(stdin, sockfd);		/* do it all */
	exit(0);
}

void str_cli(FILE *fp, int sockconn)
{
    int maxfdp1, retval, stdineof = 0;  // stdinefo 必须初始化，不然不能得到预期
    fd_set rset;
    char recvline[1024];
    char sendline[1024];
    FD_ZERO(&rset);
    while(1){
        memset(recvline, 0, sizeof(recvline));
        memset(sendline, 0, sizeof(sendline));
        if (stdineof == 0) // 如果标准输入还有数据
        {
            FD_SET(fileno(fp), &rset);
        }
        FD_SET(sockconn, &rset);
        maxfdp1 = max(fileno(fp), sockconn) + 1;

        //fprintf(stderr, "fileno(fp):%d, maxfdp1 :%d........\n", fileno(fp), maxfdp1);
        //fprintf(stderr, "select begin........\n");
        retval = select(maxfdp1, &rset, NULL, NULL, NULL);
        //fprintf(stderr, "select over........\n");

        if (retval == -1)
        {
            perror("select()");
            exit(EXIT_FAILURE);
        }
        if (FD_ISSET(sockconn, &rset))
        {
            //  本例子的目的是为了解决，服务器关闭之后能立即收到FIN，
            // 这里不再使用readline
            //fprintf(stderr, "read from socket........\n");
            int ret = read(sockconn, recvline, sizeof(recvline));
            if (ret > 0)
                write(fileno(stdout), recvline, ret);
            else if (ret == 0) // 已经写往服务器了，所以应该收到数据，如果返回0，说明服务器已经过早终止了
            {
                if (stdineof == 1)
                {
                    fprintf(stderr, "normal shutdown........\n");
                    return;  // normal termination
                }
                else
                {
                    perror("str_cli: server terminated prematurely");
                    exit(EXIT_FAILURE);
                }
            }
            else
            {
                perror("read error");
                exit(EXIT_FAILURE);
            }
        }
        if (FD_ISSET(fileno(fp), &rset))
        {
            //fprintf(stderr, "read from stdin........\n");
            int n = read(fileno(fp), sendline, sizeof(sendline)); // 键入EOF时，read 返回0
            //int n = read(fileno(fp), sendline, 10); // 键入EOF时，read 返回0
            //fprintf(stderr, "read from stdin........:%s\n", sendline);
            if (n != 0)
            {
                int retw = 0;
                //fprintf(stderr, "write to socket........\n");
                if ((retw = write(sockconn, sendline, strlen(sendline))) < 0)
                {
                    perror("write to socket error");
                    exit(EXIT_FAILURE);
                }

                //fprintf(stderr, "after write........\n");
            }
            else // 键入EOF时也返回 ,程序结束
            {
                fprintf(stderr, "get EOF........\n");
                stdineof = 1;
                shutdown(sockconn, SHUT_WR);  // 半关闭，会发送FIN
                FD_CLR(fileno(fp), &rset);  // 把标准输入去除
                continue;
            }

        }

    }

}
