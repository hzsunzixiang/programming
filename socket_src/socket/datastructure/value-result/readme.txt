

如果传给内核的结构太小，则返回不正常，特别是在
socklen_t clilen < sizeof(cliaddr) - 8;
因为最后面有8个填充字节

if ((connfd = accept(sockfd, (struct sockaddr*)&cliaddr, NULL)) < 0)
第二个参数如果是NULL报如下错误
accept error: Bad address

struct sockaddr_in
  {
    sa_family_t sin_family;
    in_port_t sin_port;
    struct in_addr sin_addr;


    unsigned char sin_zero[sizeof (struct sockaddr) -
      (sizeof (unsigned short int)) -
      sizeof (in_port_t) -
      sizeof (struct in_addr)];
  }; 


