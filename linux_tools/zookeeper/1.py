#!/usr/bin/python
# -*- coding: UTF-8 -*-
from kazoo.client import KazooClient

import time

#zk = KazooClient(hosts='127.0.0.1:2181')
zk = KazooClient(hosts='192.168.1.130:2181')

time.sleep(5)
#ericksun@debian-1:~$ sudo zk-dump --iface eth0
#	21:28:06:095201 ConnectRequest(ver=0, zxid=0, timeout=10000, session=0x0, readonly=False, client=192.168.1.110:52444)
#	————►21:28:06:100084 ConnectReply(ver=0, timeout=10000, session=0x300077893e30006, readonly=False, server=192.168.1.130:2181)
# 这个start函数才会真正发起连接请求
zk.start()
time.sleep(10000)

#https://stackoverflow.com/questions/41422395/zookeeper-communication-protocol
#Data: 00000008fffffffe0000000b
#
#00000008 - payload length
#fffffffe - connection ID
#0000000b - op code ("ping")
#At the front of each message (even before the RequestHeader), there is the length of the payload. Here we see a length of 8 bytes.
#
#The next 4 bytes are the connection ID, fffffffe.
#
#The final 4 bytes are the op code, 0000000b (or 11 in decimal). Reading ZooDefs, we can see that this is the "ping" operation. The "ping" operation is used for periodic heartbeats between client and server. There is no additional data required in the payload for the "ping" operation, so this is the end of this packet, and there is no additional data after it. For different operations, there would be additional data in the payload, representing the arguments to the operation.
#
#可以看到，连接上之后 每3s一次心跳
#ericksun@debian-1:~$ sudo tcpdump -pnni any port 2181 
#tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
#listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
#21:36:46.295180 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [S], seq 3217873824, win 29200, options [mss 1460,sackOK,TS val 35140495 ecr 0,nop,wscale 7], length 0
#21:36:46.295451 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [S.], seq 2700357860, ack 3217873825, win 28960, options [mss 1460,sackOK,TS val 35097273 ecr 35140495,nop,wscale 7], length 0
#21:36:46.295466 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [.], ack 1, win 229, options [nop,nop,TS val 35140495 ecr 35097273], length 0
#21:36:46.296970 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [P.], seq 1:50, ack 1, win 229, options [nop,nop,TS val 35140496 ecr 35097273], length 49
#21:36:46.297021 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [.], ack 50, win 227, options [nop,nop,TS val 35097273 ecr 35140496], length 0
#21:36:46.303433 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [P.], seq 1:42, ack 50, win 227, options [nop,nop,TS val 35097275 ecr 35140496], length 41
#21:36:46.303444 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [.], ack 42, win 229, options [nop,nop,TS val 35140497 ecr 35097275], length 0
#
#
#21:36:49.500116 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [P.], seq 50:62, ack 42, win 229, options [nop,nop,TS val 35141297 ecr 35097275], length 12
#21:36:49.501643 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [P.], seq 42:62, ack 62, win 227, options [nop,nop,TS val 35098074 ecr 35141297], length 20
#21:36:49.501675 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [.], ack 62, win 229, options [nop,nop,TS val 35141297 ecr 35098074], length 0
#
#
#21:36:52.457175 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [P.], seq 62:74, ack 62, win 229, options [nop,nop,TS val 35142036 ecr 35098074], length 12
#21:36:52.458070 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [P.], seq 62:82, ack 74, win 227, options [nop,nop,TS val 35098813 ecr 35142036], length 20
#21:36:52.458090 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [.], ack 82, win 229, options [nop,nop,TS val 35142036 ecr 35098813], length 0
#
#
#21:36:55.542583 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [P.], seq 74:86, ack 82, win 229, options [nop,nop,TS val 35142807 ecr 35098813], length 12
#21:36:55.543935 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [P.], seq 82:102, ack 86, win 227, options [nop,nop,TS val 35099584 ecr 35142807], length 20
#21:36:55.543971 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [.], ack 102, win 229, options [nop,nop,TS val 35142808 ecr 35099584], length 0
#
#
#
#21:36:58.528031 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [P.], seq 86:98, ack 102, win 229, options [nop,nop,TS val 35143554 ecr 35099584], length 12
#21:36:58.528823 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [P.], seq 102:122, ack 98, win 227, options [nop,nop,TS val 35100331 ecr 35143554], length 20
#21:36:58.528858 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [.], ack 122, win 229, options [nop,nop,TS val 35143554 ecr 35100331], length 0
#
#
#
#21:37:01.632987 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [P.], seq 98:110, ack 122, win 229, options [nop,nop,TS val 35144330 ecr 35100331], length 12
#21:37:01.634676 IP 192.168.1.130.2181 > 192.168.1.110.52449: Flags [P.], seq 122:142, ack 110, win 227, options [nop,nop,TS val 35101107 ecr 35144330], length 20
#21:37:01.634715 IP 192.168.1.110.52449 > 192.168.1.130.2181: Flags [.], ack 142, win 229, options [nop,nop,TS val 35144330 ecr 35101107], length 0
#
#
