

https://segmentfault.com/a/1190000009251098

+----------------------------------------------------------------+
|                                                                |
|       +------------------------------------------------+       |
|       |             Newwork Protocol Stack             |       |
|       +------------------------------------------------+       |
|              ↑               ↑               ↑                 |
|..............|...............|...............|.................|
|              ↓               ↓               ↓                 |
|        +----------+    +-----------+   +-----------+           |
|        |   eth0   |    |   veth0   |   |   veth1   |           |
|        +----------+    +-----------+   +-----------+           |
|192.168.1.11  ↑               ↑               ↑                 |
|              |               +---------------+                 |
|              |         192.168.2.11     192.168.2.1            |
+--------------|-------------------------------------------------+
               ↓
         Physical Network

sudo ip link add veth0 type veth peer name veth1


ericksun@debian-4:~/programming/linux/veth$ ip a s veth0
14: veth0@veth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 66:8c:3e:36:99:7f brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.11/24 scope global veth0
       valid_lft forever preferred_lft forever
    inet6 fe80::648c:3eff:fe36:997f/64 scope link
       valid_lft forever preferred_lft forever
ericksun@debian-4:~/programming/linux/veth$ ip a s veth1
13: veth1@veth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 3e:27:8b:a7:42:f8 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.1/24 scope global veth1
       valid_lft forever preferred_lft forever
    inet6 fe80::3c27:8bff:fea7:42f8/64 scope link
       valid_lft forever preferred_lft forever

ericksun@debian-4:~/programming/linux/veth$ ping  192.168.2.1 -I veth0 -c 4
PING 192.168.2.1 (192.168.2.1) from 192.168.2.11 veth0: 56(84) bytes of data.



# 可以看到reply 请求到达了回环口 lo

ericksun@debian-4:~$ sudo tcpdump  -pnni veth1
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on veth1, link-type EN10MB (Ethernet), capture size 262144 bytes
07:45:24.737316 IP 192.168.2.11 > 192.168.2.1: ICMP echo request, id 8790, seq 1, length 64
07:45:25.767985 IP 192.168.2.11 > 192.168.2.1: ICMP echo request, id 8790, seq 2, length 64
07:45:26.792118 IP 192.168.2.11 > 192.168.2.1: ICMP echo request, id 8790, seq 3, length 64
07:45:27.816020 IP 192.168.2.11 > 192.168.2.1: ICMP echo request, id 8790, seq 4, length 64




tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on lo, link-type EN10MB (Ethernet), capture size 262144 bytes
07:45:24.737337 IP 192.168.2.1 > 192.168.2.11: ICMP echo reply, id 8790, seq 1, length 64
07:45:25.768033 IP 192.168.2.1 > 192.168.2.11: ICMP echo reply, id 8790, seq 2, length 64
07:45:26.792146 IP 192.168.2.1 > 192.168.2.11: ICMP echo reply, id 8790, seq 3, length 64
07:45:27.816080 IP 192.168.2.1 > 192.168.2.11: ICMP echo reply, id 8790, seq 4, length 64

