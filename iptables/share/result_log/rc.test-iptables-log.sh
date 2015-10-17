#!/bin/bash



iptables -t filter -A INPUT -s 10.240.0.0/16 -p icmp -j LOG --log-prefix "InAccept "
