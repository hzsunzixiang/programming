#!/bin/bash
#


iptables -N LOGDROP

iptables -A INPUT -s 172.16.0.0/12 -j LOGDROP

iptables -A INPUT -s 10.0.0.0/8 -j LOGDROP

iptables -A LOGDROP -j LOG --log-level 4 --log-prefix 'SourceDrop '

iptables -A LOGDROP -j DROP

