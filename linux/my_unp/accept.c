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
    int sockfd, newsockfd, portno;
    struct sockaddr_in serv_addr, cli_addr;
    socklen_t clilen;
    sockfd = socket(AF_INET, SOCK_STREAM, 0 ); // sys/socket.h
    if (sockfd < 0)
    {
        perror("Error opening socket!");
        exit(1);
    }
    printf("build socket sucess.\n");
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
    printf("bind socket sucess!\n");

    /* Now start listening for the clients, here process will "not" 
    * go in sleep mode and "kernel" will wait for the incoming connection
    */
    if (listen(sockfd ,5) < 0)
    {
        perror("listen failed.");
    }

    printf("listen socket sucess!\n");
    while (1)
    {
        printf("in while!\n");
        clilen = sizeof(cli_addr);
        newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
        printf("accept socket sucess!\n");
        if (newsockfd < 0)
        {
            perror("ERROR on accept");
            exit(1);
        }
    }

        sleep(10000);






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
