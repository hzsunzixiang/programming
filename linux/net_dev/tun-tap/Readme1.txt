https://segmentfault.com/a/1190000009249039
https://www.kernel.org/doc/Documentation/networking/tuntap.txt
#--------------------------第一个shell窗口----------------------
#将上面的程序保存成tun.c，然后编译
dev@debian:~$ gcc tun.c -o tun

#启动tun程序，程序会创建一个新的tun设备，
#程序会阻塞在这里，等着数据包过来
dev@debian:~$ sudo ./tun
Open tun/tap device tun1 for reading...
Read 84 bytes from tun/tap device
Read 84 bytes from tun/tap device
Read 84 bytes from tun/tap device
Read 84 bytes from tun/tap device

#--------------------------第二个shell窗口----------------------
#启动抓包程序，抓经过tun1的包
# tcpdump -i tun1
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on tun1, link-type RAW (Raw IP), capture size 262144 bytes
19:57:13.473101 IP 192.168.3.11 > 192.168.3.12: ICMP echo request, id 24028, seq 1, length 64
19:57:14.480362 IP 192.168.3.11 > 192.168.3.12: ICMP echo request, id 24028, seq 2, length 64
19:57:15.488246 IP 192.168.3.11 > 192.168.3.12: ICMP echo request, id 24028, seq 3, length 64
19:57:16.496241 IP 192.168.3.11 > 192.168.3.12: ICMP echo request, id 24028, seq 4, length 64

#--------------------------第三个shell窗口----------------------
#./tun启动之后，通过ip link命令就会发现系统多了一个tun设备，
#在我的测试环境中，多出来的设备名称叫tun1，在你的环境中可能叫tun0
#新的设备没有ip，我们先给tun1配上IP地址
dev@debian:~$ sudo ip addr add 192.168.3.11/24 dev tun1

#默认情况下，tun1没有起来，用下面的命令将tun1启动起来
dev@debian:~$ sudo ip link set tun1 up

#尝试ping一下192.168.3.0/24网段的IP，
#根据默认路由，该数据包会走tun1设备，
#由于我们的程序中收到数据包后，啥都没干，相当于把数据包丢弃了，
#所以这里的ping根本收不到返回包，
#但在前两个窗口中可以看到这里发出去的四个icmp echo请求包，
#说明数据包正确的发送到了应用程序里面，只是应用程序没有处理该包
dev@debian:~$ ping -c 4 192.168.3.12
PING 192.168.3.12 (192.168.3.12) 56(84) bytes of data.

--- 192.168.3.12 ping statistics ---
4 packets transmitted, 0 received, 100% packet loss, time 3023ms
