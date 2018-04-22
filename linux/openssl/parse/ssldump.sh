ericksun@debian:~/programming/linux/openssl/helloworld$ sudo ssldump -k mykey.pem -i any -dnq
New TCP connection #1: 127.0.0.1(48090) <-> 127.0.0.1(12345)
1 1  0.0054 (0.0054)  C>S  Handshake      ClientHello
1 2  0.0062 (0.0008)  S>C  Handshake      ServerHello
1 3  0.0062 (0.0000)  S>C  Handshake      Certificate
1 4  0.0062 (0.0000)  S>C  Handshake      ServerKeyExchange
1 5  0.0062 (0.0000)  S>C  Handshake      ServerHelloDone
1 6  0.0067 (0.0004)  C>S  Handshake      ClientKeyExchange
1 7  0.0067 (0.0000)  C>S  ChangeCipherSpec
1 8  0.0067 (0.0000)  C>S  Handshake
1 9  0.0069 (0.0001)  S>C  ChangeCipherSpec
1 10 0.0069 (0.0000)  S>C  Handshake
1 11 0.0070 (0.0001)  C>S  application_data
1 12 0.0071 (0.0000)  S>C  application_data
1    0.0071 (0.0000)  S>C  TCP FIN
1 13 0.0072 (0.0000)  C>S  Alert




New TCP connection #2: 127.0.0.1(48092) <-> 127.0.0.1(12345)
2 1  0.0000 (0.0000)  C>S  Handshake      ClientHello
2 2  0.0007 (0.0006)  S>C  Handshake      ServerHello
2 3  0.0007 (0.0000)  S>C  Handshake      Certificate
2 4  0.0007 (0.0000)  S>C  Handshake      ServerKeyExchange
2 5  0.0007 (0.0000)  S>C  Handshake      ServerHelloDone
2 6  0.0012 (0.0004)  C>S  Handshake      ClientKeyExchange
2 7  0.0012 (0.0000)  C>S  ChangeCipherSpec
2 8  0.0012 (0.0000)  C>S  Handshake
2 9  0.0014 (0.0002)  S>C  Handshake2 10 0.0014 (0.0000)  S>C  ChangeCipherSpec
2 11 0.0014 (0.0000)  S>C  Handshake
2 12 0.0016 (0.0001)  C>S  application_data
2 13 0.0016 (0.0000)  S>C  application_data
2    0.0016 (0.0000)  S>C  TCP FIN
2    0.0017 (0.0000)  C>S  TCP FIN

