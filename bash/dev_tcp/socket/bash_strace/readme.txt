根据tty 获取目前的bash所在进程id 比如 22510
在另一个窗口执行strace
在本窗口执行exec 3<> /dev/tcp/${1:-www.baidu.com}/80
就可以看到结果


注意一定要在当前shell中运行
如果新起一个shell 看不到结果

StephenSun@debian-1:~/programming/bash/dev_tcp/socket$ sudo strace -e network -p 22510                                                       
Process 22510 attached - interrupt to quit
socket(PF_INET, SOCK_DGRAM|SOCK_NONBLOCK, IPPROTO_IP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("202.96.128.86")}, 16) = 0
syscall_307(0x4, 0x7ffc2b403170, 0x2, 0x4000, 0x4, 0xe944182e, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778, 0x1c843778) = 0x2
recvfrom(4, "0\220\201\200\0\1\0\3\0\0\0\0\3www\5baidu\3com\0\0\1\0\1\300"..., 2048, 0, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("202.96.128.86")}, [16]) = 90
recvfrom(4, "i\213\201\200\0\1\0\1\0\1\0\0\3www\5baidu\3com\0\0\34\0\1\300"..., 65536, 0, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("202.96.128.86")}, [16]) = 115
socket(PF_NETLINK, SOCK_RAW, 0)         = 4
bind(4, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
getsockname(4, {sa_family=AF_NETLINK, pid=22510, groups=00000000}, [12]) = 0
sendto(4, "\24\0\0\0\26\0\1\3\277\247\310Y\0\0\0\0\0\0\0\0", 20, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 20
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"L\0\0\0\24\0\2\0\277\247\310Y\356W\0\0\2\10\200\376\1\0\0\0\10\0\1\0\177\0\0\1"..., 4096}], msg_controllen=0, msg_flags=0}, 0) = 164
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"H\0\0\0\24\0\2\0\277\247\310Y\356W\0\0\n\200\200\376\1\0\0\0\24\0\1\0\0\0\0\0"..., 4096}], msg_controllen=0, msg_flags=0}, 0) = 144
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, msg_iov(1)=[{"\24\0\0\0\3\0\2\0\277\247\310Y\356W\0\0\0\0\0\0\1\0\0\0\24\0\1\0\0\0\0\0"..., 4096}], msg_controllen=0, msg_flags=0}, 0) = 20
socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("14.215.177.38")}, 16) = 0
getsockname(4, {sa_family=AF_INET, sin_port=htons(33654), sin_addr=inet_addr("192.168.1.105")}, [16]) = 0
connect(4, {sa_family=AF_UNSPEC, sa_data="\0\0\0\0\0\0\0\0\0\0\0\0\0\0"}, 16) = 0
connect(4, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("14.215.177.39")}, 16) = 0
getsockname(4, {sa_family=AF_INET, sin_port=htons(41700), sin_addr=inet_addr("192.168.1.105")}, [16]) = 0
socket(PF_INET, SOCK_STREAM, IPPROTO_TCP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("14.215.177.38")}, 16) = 0

