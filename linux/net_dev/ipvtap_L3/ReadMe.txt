


mac地址一样
[root@libvirt-1 ipvtap_L3]# ip l
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: ens160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:a5:80:0a brd ff:ff:ff:ff:ff:ff
    altname enp2s0
10: ipvtap1@ens160: <BROADCAST,MULTICAST,NOARP> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 500
    link/ether 00:0c:29:a5:80:0a brd ff:ff:ff:ff:ff:ff
11: ipvtap2@ens160: <BROADCAST,MULTICAST,NOARP> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 500
    link/ether 00:0c:29:a5:80:0a brd ff:ff:ff:ff:ff:ff
