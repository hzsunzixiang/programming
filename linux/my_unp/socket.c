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


    int sockfd;
    sockfd = socket(AF_INET, SOCK_STREAM, 0 ); // sys/socket.h
    if (sockfd < 0)
    {
        perror("Error opening socket!");
        exit(1);
    }
    printf("build socket sucess.\n");
    
   //    EACCES Permission to create a socket of the specified type and/or protocol is denied.

   //    EAFNOSUPPORT
   //           The implementation does not support the specified address family.
   // sockfd = socket(1000, SOCK_STREAM, 0 ); // sys/socket.h
   // if (sockfd < 0)
   // {
   //     perror("Error opening socket!");
   //     exit(1);
   // }
   // printf("build socket sucess.\n");

   //    EINVAL Unknown protocol, or protocol family not available.
   // sockfd = socket(AF_INET, SOCK_STREAM, 99 ); // sys/socket.h
   // if (sockfd < 0)
   // {
   //     perror("Error opening socket!");
   //     exit(1);
   // }
   // printf("build socket sucess.\n");

   //    EINVAL Invalid flags in type.
    //sockfd = socket(AF_INET, SOCK_STREAM, 99 ); // sys/socket.h
    //if (sockfd < 0)
    //{
    //    perror("Error opening socket!");
    //    exit(1);
    //}
    //printf("build socket sucess.\n");

   //    EMFILE Process file table overflow.
    // 这个也可以模拟，用PAM

   //    ENFILE The system limit on the total number of open files has been reached.

   //    ENOBUFS or ENOMEM
   //           Insufficient memory is available.  The socket cannot be created until sufficient resources are freed.

   //    EPROTONOSUPPORT
   //           The protocol type or the specified protocol is not supported within this domain.
    //sockfd = socket(AF_ROUTE, SOCK_STREAM, IPPROTO_TCP ); // sys/socket.h
   // sockfd = socket(AF_ROUTE, SOCK_STREAM, 0); // sys/socket.h
   // if (sockfd < 0)
   // {
   //     perror("Error opening socket!");
   //     exit(1);
   // }
   // printf("build socket sucess.\n");






//   int sockfd, newsockfd, portno, clilen;
//   char buffer[256];
//   struct sockaddr_in serv_addr, cli_addr;
//   int  n;
//   
//   /* First call to socket() function */
//   sockfd = socket(AF_INET, SOCK_STREAM, 0);
//   
//   if (sockfd < 0)
//      {
//      perror("ERROR opening socket");
//      exit(1);
//      }
//   
//   /* Initialize socket structure */
//   bzero((char *) &serv_addr, sizeof(serv_addr));
//   portno = 5001;
//   
//   serv_addr.sin_family = AF_INET;
//   serv_addr.sin_addr.s_addr = INADDR_ANY;
//   serv_addr.sin_port = htons(portno);
//   
//   /* Now bind the host address using bind() call.*/
//   if (bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
//      {
//      perror("ERROR on binding");
//      exit(1);
//      }
//      
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
