recon_use
=====

An OTP application

Build
-----




抓包发现 使用的ip 是172.16.117.1 

也就是mac无法直接访问虚拟机

但是虚拟机能够找到mac，也就是宿主机, 所以需要绕过去
找一个隐藏节点，先用虚拟机连接mac，再用mac连接回来



虚拟机到mac:
06:14:22.308295 ens160 Out IP 172.16.117.132.32874 > 10.91.28.159.4369: Flags [S], seq 2096482925, win 32120, options [mss 1460,sackOK,TS val 261745912 ecr 0,nop,wscale 7], length 0
06:14:22.309600 ens160 In  IP 10.91.28.159.4369 > 172.16.117.132.32874: Flags [S.], seq 3260692624, ack 2096482926, win 64240, options [mss 1460], length 0
06:14:22.309676 ens160 Out IP 172.16.117.132.32874 > 10.91.28.159.4369: Flags [.], ack 1, win 32120, length 0
06:14:22.309847 ens160 Out IP 172.16.117.132.32874 > 10.91.28.159.4369: Flags [P.], seq 1:9, ack 1, win 32120, length 8
06:14:22.310345 ens160 In  IP 10.91.28.159.4369 > 172.16.117.132.32874: Flags [.], ack 9, win 64240, length 0
06:14:22.310681 ens160 In  IP 10.91.28.159.4369 > 172.16.117.132.32874: Flags [FP.], seq 1:20, ack 9, win 64240, length 19
06:14:22.310896 ens160 Out IP 172.16.117.132.32874 > 10.91.28.159.4369: Flags [F.], seq 9, ack 21, win 32100, length 0
06:14:22.311362 ens160 In  IP 10.91.28.159.4369 > 172.16.117.132.32874: Flags [.], ack 10, win 64239, length 0



mac 到虚拟机：虚拟机收到的报文无法回包
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on any, link-type LINUX_SLL2 (Linux cooked v2), snapshot length 262144 bytes
06:10:18.860948 ens160 In  IP 172.16.117.1.55728 > 172.16.117.132.4369: Flags [S], seq 494812023, win 65535, options [mss 1460,nop,wscale 6,nop,nop,TS val 1080621468 ecr
0,sackOK,eol], length 0
