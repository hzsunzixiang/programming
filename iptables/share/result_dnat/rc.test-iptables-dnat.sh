#!/bin/bash
#




#iptables -t nat -A PREROUTING -p tcp -d 10.240.156.16 --dport 8080 -j DNAT --to-destination 192.168.2.78:80
#NAPT
#iptables -t nat -A PREROUTING -p tcp -d 10.240.156.16 --dport 80 -j DNAT --to-destination 192.168.2.78
iptables -t nat -A PREROUTING  -d 10.240.156.16  -j LOG --log-prefix="dnat PREROUTING:"
iptables -t nat -A PREROUTING  -d 10.240.156.16  -j DNAT --to-destination 192.168.2.78

#iptables -t nat -A OUTPUT -p tcp -d 10.240.156.16 --dport 80 -j DNAT --to-destination 192.168.2.78
iptables -t nat -A OUTPUT      -d 10.240.156.16  -j DNAT --to-destination 192.168.2.78


# 内网访问解决方案




