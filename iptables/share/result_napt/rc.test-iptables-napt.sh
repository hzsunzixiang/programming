#!/bin/bash

#
# NAPT 
#

iptables -t nat -A PREROUTING  -p tcp --dport 80 \
-j DNAT --to 192.168.2.78:80

iptables -t nat -A OUTPUT  -p tcp --dport 80 \
-j DNAT --to 192.168.2.78:80

#iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.0/24 -j MASQUERADE







#iptables -t nat -A PREROUTING -p tcp -d 15.45.23.67 --dport 80 -j DNAT --to-destination 192.168.1.1-192.168.1.10
