#!/usr/bin/env python
# -*- coding:UTF-8

# Echo client program
import socket

HOST = 'localhost'    # The remote host
PORT = 50007              # The same port as used by the server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
s.sendall('Hello, world')
data = s.recv(1024)
s.close()
print 'Received', repr(data)

# 这一段是解析host的

# socket(PF_NETLINK, SOCK_RAW, NETLINK_ROUTE) = 4
# bind(4, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
# getsockname(4, {sa_family=AF_NETLINK, pid=1850, groups=00000000}, [12]) = 0
# sendto(4, "\24\0\0\0\26\0\1\3c\327\31W\0\0\0\0\0\0\0\0", 20, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 20
# recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"L\0\0\0\24\0\2\0c\327\31W:\7\0\0\2\10\200\376\1\0\0\0\10\0\1\0\177\0\0\1"..., 4096}], msg_controllen=0,
# 		 msg_flags=0}, 0) = 164
# recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"H\0\0\0\24\0\2\0c\327\31W:\7\0\0\n\200\200\376\1\0\0\0\24\0\1\0\0\0\0\0"..., 4096}], msg_controllen=0,
# 		msg_flags=0}, 0) = 144
# recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"\24\0\0\0\3\0\2\0c\327\31W:\7\0\0\0\0\0\0", 4096}], msg_controllen=0, msg_flags=0}, 0) = 20
# close(4)                                = 0
# socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
# connect(4, {sa_family=AF_INET, sin_port=htons(0), sin_addr=inet_addr("127.0.0.1")}, 16) = 0
# getsockname(4, {sa_family=AF_INET, sin_port=htons(42481), sin_addr=inet_addr("127.0.0.1")}, [16]) = 0
# close(4)                                = 0
# connect(3, {sa_family=AF_INET, sin_port=htons(50007), sin_addr=inet_addr("127.0.0.1")}, 16) = 0
# sendto(3, "Hello, world", 12, 0, NULL, 0) = 12
# recvfrom(3, "Hello, world", 1024, 0, NULL, NULL) = 12



# socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 3
# .......
# connect(3, {sa_family=AF_INET, sin_port=htons(50007), sin_addr=inet_addr("127.0.0.1")}, 16) = 0
# sendto(3, "Hello, world", 12, 0, NULL, 0) = 12
# recvfrom(3, "Hello, world", 1024, 0, NULL, NULL) = 12


