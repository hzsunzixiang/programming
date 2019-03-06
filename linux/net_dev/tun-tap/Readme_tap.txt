#--------------------------第一个shell窗口----------------------
#将上面的程序保存成tap.c，然后编译

ericksun@debian-4:~/programming/linux/net_dev/tap-tap$ make
gcc -Wall -g  tun.c -o tun
gcc -Wall -g  tap.c -o tap



#启动tap程序，程序会创建一个新的tap设备，
#程序会阻塞在这里，等着数据包过来

ericksun@debian-4:~/programming/linux/net_dev/tun-tap$ sudo ./tap
Open tun/tap device: tap0 for reading...
Read 90 bytes from tun/tap device
Read 90 bytes from tun/tap device
Read 78 bytes from tun/tap device
Read 90 bytes from tun/tap device


#--------------------------第二个shell窗口----------------------
#启动抓包程序，抓经过tap0的包
  其实这个包经过的是外出接口 tap0上抓不到包
ericksun@debian-4:~/programming/linux/net_dev/tun-tap$ sudo tcpdump -pnni any icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
10:01:36.539040 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 1, length 64
10:01:36.539092 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 1, length 64
10:01:37.543719 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 2, length 64
10:01:37.543826 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 2, length 64
10:01:38.567752 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 3, length 64
10:01:38.567872 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 3, length 64
10:01:39.591938 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 4, length 64
10:01:39.592034 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 4, length 64



#--------------------------第三个shell窗口----------------------
#./tap启动之后，通过ip link命令就会发现系统多了一个tap设备，
#在我的测试环境中，多出来的设备名称叫tap0，在你的环境中可能叫tun1
#新的设备没有ip，我们先给tap0配上IP地址

ericksun@debian-4:~/programming/linux/net_dev/tun-tap$ sudo ip address add 192.168.1.100/24 dev tap0

#默认情况下，tap0没有起来，用下面的命令将tap0启动起来
ericksun@debian-4:~/programming/linux/net_dev/tun-tap$ sudo ip link set tap0 up

#尝试ping一下外出网关， 从接口 192.168.1.100 发出 

ericksun@debian-4:~/programming/linux/net_dev/tun-tap$ ping 192.168.247.2 -I 192.168.1.100 -c 4
PING 192.168.247.2 (192.168.247.2) from 192.168.1.100 : 56(84) bytes of data.
64 bytes from 192.168.247.2: icmp_seq=1 ttl=128 time=0.064 ms
64 bytes from 192.168.247.2: icmp_seq=2 ttl=128 time=0.127 ms
64 bytes from 192.168.247.2: icmp_seq=3 ttl=128 time=0.139 ms
64 bytes from 192.168.247.2: icmp_seq=4 ttl=128 time=0.130 ms

--- 192.168.247.2 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3052ms
rtt min/avg/max/mdev = 0.064/0.115/0.139/0.029 ms

ericksun@debian-4:~/programming/linux/net_dev/tun-tap$ ip r
default via 192.168.247.2 dev ens33
192.168.1.0/24 dev tap0 proto kernel scope link src 192.168.1.100
192.168.3.0/24 dev veth1 proto kernel scope link src 192.168.3.102
192.168.3.0/24 dev br0 proto kernel scope link src 192.168.3.101
192.168.247.0/24 dev ens33 proto kernel scope link src 192.168.247.137



ericksun@debian-4:~/programming/linux/net_dev/tun-tap$ sudo tcpdump -pnni any icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
10:01:36.539040 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 1, length 64
10:01:36.539092 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 1, length 64
10:01:37.543719 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 2, length 64
10:01:37.543826 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 2, length 64
10:01:38.567752 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 3, length 64
10:01:38.567872 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 3, length 64
10:01:39.591938 IP 192.168.1.100 > 192.168.247.2: ICMP echo request, id 10511, seq 4, length 64
10:01:39.592034 IP 192.168.247.2 > 192.168.1.100: ICMP echo reply, id 10511, seq 4, length 64

