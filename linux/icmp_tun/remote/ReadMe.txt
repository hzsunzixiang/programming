http://neverfear.org/blog/view/9/Using_ICMP_tunneling_to_steal_Internet

https://www.giac.org/paper/gsec/1354/icmp-crafting-issues/102553


TODO

Ping Power — ICMP Tunnel
https://medium.com/bugbountywriteup/ping-power-icmp-tunnel-31e2abb2aaea


https://github.com/T3rry7f/ICMPTunnel

https://github.com/oing9179/python-icmp-tunnel
https://oing9179.github.io/blog/2017/06/The-ICMP-Tunnel/

https://github.com/yannayl/pingtun


主要参考这篇文章
https://medium.com/bugbountywriteup/ping-power-icmp-tunnel-31e2abb2aaea

# 修改代码
  把ip改成相应的机器

# 运行
在 192.168.247.137 上运行客户端
输出有时正确，有时错误
ericksun@debian-4:~/programming/linux/icmp_tun/remote$ sudo python3 C2.py
.
Sent 1 packets.
/home/ericksun/programming/linux/icmp_tun


在 192.168.247.136 上运行Agent
ericksun@debian-3:~/programming/linux/icmp_tun$ sudo python3 Agent.py


# 同时抓包
抓包可见, 收到两个reply包 
如何屏蔽内核产生的包

ericksun@debian-4:~/programming/linux/icmp_tun$ sudo tcpdump -Xpnni any icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes


19:16:51.844702 IP 192.168.247.137 > 192.168.247.136: ICMP echo request, id 1, seq 1, length 11
        0x0000:  4500 001f 0001 0000 4001 0a7a c0a8 f789  E.......@..z....
        0x0010:  c0a8 f788 0800 2386 0001 0001 7077 64    ......#.....pwd
19:16:51.844908 IP 192.168.247.136 > 192.168.247.137: ICMP echo reply, id 1, seq 1, length 11
        0x0000:  4500 001f e8cf 0000 4001 21ab c0a8 f788  E.......@.!.....
        0x0010:  c0a8 f789 0000 2b86 0001 0001 7077 6400  ......+.....pwd.
        0x0020:  0000 0000 0000 0000 0000 0000 0000       ..............
19:16:51.913306 IP 192.168.247.136 > 192.168.247.137: ICMP echo reply, id 1, seq 1, length 50
        0x0000:  4500 0046 0001 0000 4001 0a53 c0a8 f788  E..F....@..S....
        0x0010:  c0a8 f789 0000 11a8 0001 0001 2f68 6f6d  ............/hom
        0x0020:  652f 6572 6963 6b73 756e 2f70 726f 6772  e/ericksun/progr
        0x0030:  616d 6d69 6e67 2f6c 696e 7578 2f69 636d  amming/linux/icm
        0x0040:  705f 7475 6e0a                           p_tun.





# 修改内核参数之后
https://github.com/T3rry7f/ICMPTunnel
Server : echo 1> /proc/sys/net/ipv4/icmp_echo_ignore_all




# 服务端

ericksun@debian-3:~/programming/linux/icmp_tun$ sudo python3 Agent.py

Sent 1 packets.
res: /home/ericksun/programming/linux/icmp_tun

