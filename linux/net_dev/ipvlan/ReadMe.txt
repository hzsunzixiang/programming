


mac地址一样
2: ens160: <BROADCAST,MULTICAST,PROMISC,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:a5:80:0a brd ff:ff:ff:ff:ff:ff
    altname enp2s0
37: ipvl0@ens160: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:a5:80:0a brd ff:ff:ff:ff:ff:ff
38: ipvl1@ens160: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:a5:80:0a brd ff:ff:ff:ff:ff:ff

能ping通网关
[root@libvirt-1 ipvlan]# ping 172.16.117.2
PING 172.16.117.2 (172.16.117.2) 56(84) bytes of data.
64 bytes from 172.16.117.2: icmp_seq=1 ttl=128 time=1.93 ms
64 bytes from 172.16.117.2: icmp_seq=2 ttl=128 time=0.876 ms
64 bytes from 172.16.117.2: icmp_seq=3 ttl=128 time=0.803 ms

能路由到外界
[root@libvirt-1 ipvlan]# ip r
default via 172.16.117.2 dev ipvl0
172.16.117.0/24 dev ipvl0 proto kernel scope link src 172.16.117.10
[root@libvirt-1 ipvlan]# ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=128 time=9.17 ms
