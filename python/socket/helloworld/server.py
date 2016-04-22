#!/usr/bin/env python
# -*- coding:UTF-8
# Echo server program
import socket

HOST = ''                 # Symbolic name meaning all available interfaces
PORT = 5000              # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print 'Connected by', addr
while 1:
    data = conn.recv(1024)
    if not data: break
    conn.sendall(data)
conn.close()



#socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 3
#bind(3, {sa_family=AF_INET, sin_port=htons(50007), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
#listen(3, 1)                            = 0
#accept(3,

