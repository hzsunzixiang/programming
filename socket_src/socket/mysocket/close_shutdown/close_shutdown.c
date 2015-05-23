#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[])
{
    int sock;
    if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
    {
        perror("build socket fail");
        exit(1);
    }

    struct sockaddr_in servaddr;
    memset(&servaddr, 0, sizeof(servaddr));

    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);

    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton fail!");
        exit(1);
    }


    if (connect(sock, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("connect fail");
        exit(1);
    }
    fprintf(stderr, "being close fd\n");
    char c = getchar();
    // 分别实验shutdown 和 close
    //close(sock);
    //shutdown(sock, SHUT_RD);
    shutdown(sock, SHUT_WR);
    fprintf(stderr, "after close fd\n");

    c = getchar();

    return 0;
}
