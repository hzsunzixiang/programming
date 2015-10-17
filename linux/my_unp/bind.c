#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>



int main( int argc, char *argv[] )
{


    int sockfd, portno;
    struct sockaddr_in serv_addr,  serv_addr1;
    sockfd = socket(AF_INET, SOCK_STREAM, 0 ); // sys/socket.h
    if (sockfd < 0)
    {
        perror("Error opening socket!");
        exit(1);
    }
    int enable = 1;
    if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &enable, sizeof(int)) < 0)
        perror("setsockopt(SO_REUSEADDR) failed");
    printf("build socket sucess.%d\n", sockfd);
    /* Initialize socket structure */
    bzero((char *) &serv_addr, sizeof(serv_addr));
    portno = 8888;
    serv_addr.sin_family = AF_INET;
    //if (inet_aton(argv[1], &addr) == 0) {
    //    fprintf(stderr, "Invalid address\n");
    //    exit(EXIT_FAILURE);
    //}
    serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    serv_addr.sin_port = htons(portno);
    /* Now bind the host address using bind() call.*/
    if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    {
        perror("error on binding");
        exit(1);
    }
    //printf("bind socket sucess!\n");

    //EACCES The address is protected, and the user is not the superuser.

    //EADDRINUSE
    //       The given address is already in use.
    // 同时绑定两次
    //if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    //{
    //    perror("error on binding");
    //    exit(1);
    //}
    //printf("bind socket sucess!\n");


    //EBADF  sockfd is not a valid descriptor.
    //if (bind(100, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    //{
    //    perror("error on binding");
    //    exit(1);
    //}
    //printf("bind socket sucess!\n");


    //EINVAL The socket is already bound to an address.
    //bzero((char *) &serv_addr1, sizeof(serv_addr1));
    //portno = 8887;
    //serv_addr1.sin_family = AF_INET;
    //struct in_addr addr;
    //if (inet_aton("192.168.1.102", &addr) == 0) {
    //    fprintf(stderr, "Invalid address\n");
    //    exit(EXIT_FAILURE);
    //}
    //serv_addr1.sin_addr.s_addr = addr.s_addr; 
    //serv_addr1.sin_port = htons(9999);
    //if (bind(sockfd, (struct sockaddr *)&serv_addr1, sizeof(serv_addr1)) < 0)
    //{
    //    perror("error on binding");
    //    exit(1);
    //}
    //printf("bind socket sucess!\n");

    //if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    //{
    //    perror("error on binding");
    //    exit(1);
    //}
    //printf("bind socket sucess!\n");


    //ENOTSOCK
    //       sockfd is a descriptor for a file, not a socket.


    //if (bind(1, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
    //{
    //    perror("error on binding");
    //    exit(1);
    //}
    //printf("bind socket sucess!\n");

    //The following errors are specific to UNIX domain (AF_UNIX) sockets:

    //EACCES Search permission is denied on a component of the path prefix.  (See also path_resolution(7).)

    //EADDRNOTAVAIL
    //       A nonexistent interface was requested or the requested address was not local.

    //EFAULT addr points outside the user's accessible address space.

    //EINVAL The addrlen is wrong, or the socket was not in the AF_UNIX family.

    //ELOOP  Too many symbolic links were encountered in resolving addr.
    //ENAMETOOLONG
    //       addr is too long.

    //ENOENT The file does not exist.

    //ENOMEM Insufficient kernel memory was available.

    //ENOTDIR
    //       A component of the path prefix is not a directory.

    //EROFS  The socket inode would reside on a read-only file system.


    sleep(10000);



    ///* Internet address.  */
    //typedef uint32_t in_addr_t;
    //struct in_addr
    //{
    //    in_addr_t s_addr;
    //};

    //in_addr_t inet_addr(const char *cp);
    //    int inet_aton(const char *cp, struct in_addr *inp);









    //   /* Now start listening for the clients, here process will
    //   * go in sleep mode and will wait for the incoming connection
    //   */
    //   
    //   listen(sockfd,5);
    //   clilen = sizeof(cli_addr);
    //   
    //   /* Accept actual connection from the client */
    //   newsockfd = accept(sockfd, (struct sockaddr *)&cli_addr, &clilen);
    //   if (newsockfd < 0)
    //      {
    //      perror("ERROR on accept");
    //      exit(1);
    //      }
    //   
    //   /* If connection is established then start communicating */
    //   bzero(buffer,256);
    //   n = read( newsockfd,buffer,255 );
    //   
    //   if (n < 0)
    //      {
    //      perror("ERROR reading from socket");
    //      exit(1);
    //      }
    //   
    //   printf("Here is the message: %s\n",buffer);
    //   
    //   /* Write a response to the client */
    //   n = write(newsockfd,"I got your message",18);
    //   
    //   if (n < 0)
    //      {
    //      perror("ERROR writing to socket");
    //      exit(1);
    //      }

    return 0;
}
