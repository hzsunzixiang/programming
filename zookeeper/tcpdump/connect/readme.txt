ericksun@debian-1:~$ sudo zk-dump  --iface eth0
21:42:21:629486 ConnectRequest(ver=0, zxid=0, timeout=30000, session=0x0, readonly=False, client=192.168.1.110:52453)
————►21:42:21:634161 ConnectReply(ver=0, timeout=30000, session=0x300077893e3000f, readonly=False, server=192.168.1.130:2181)

这个抓包用的是zkCli.sh客户端
从抓包来看，是客户端向服务端发送心跳，服务端响应


