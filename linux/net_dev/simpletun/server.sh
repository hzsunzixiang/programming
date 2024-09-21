#!/bin/bash 
#[remote]# openvpn --mktun --dev tun3 --user waldner
#Fri Mar 26 11:11:41 2010 TUN/TAP device tun3 opened
#Fri Mar 26 11:11:41 2010 Persist state set to: ON


#ip tuntap add dev tun3 mode tap user ericksun
#ip tuntap del dev tun3 mode tap 
ip tuntap add dev tun3 mode tap 
ip addr add 192.168.0.2/24 dev tun3
ip link set tun3 up

#./simpletun -i tun3 -s
