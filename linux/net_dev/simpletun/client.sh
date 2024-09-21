#!/bin/bash
#[local]# openvpn --mktun --dev tun11 --user waldner
#Fri Mar 26 11:17:37 2010 TUN/TAP device tun11 opened
#Fri Mar 26 11:17:37 2010 Persist state set to: ON


#ip tuntap add dev tun11 mode tap user ericksun
ip tuntap add dev tun11 mode tun 
ip link set tun11 up
ip addr add 192.168.0.1/24 dev tun11

./simpletun -i tun11 -c 172.16.117.136
