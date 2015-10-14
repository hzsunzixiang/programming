#!/bin/bash
#


iptables -t nat -A PREROUTING  -p tcp --dport 8080 -j REDIRECT --to-ports 80
iptables -t nat -A OUTPUT      -p tcp --dport 8080 -j REDIRECT --to-ports 80
