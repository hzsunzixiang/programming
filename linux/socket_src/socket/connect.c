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
    sleep(10000);

    return 0;
}
