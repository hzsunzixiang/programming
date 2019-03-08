#!/usr/bin/env python3

from scapy.all import *


def main():
    while True:
        command = input('# Enter command: ')
        # build the ICMP packet with the command as the payload
        pinger = IP(dst="127.0.0.1")/ICMP(id=0x0001, seq=0x1)/command
        send(pinger)
        # wait for the ICMP message containing the answer from the agent   
        # to be received
        rx = sniff(count=1, timeout=2)
        # use this if agent is not on local machine: 
		#rx = sniff(filter="icmp", count=1)
        print(rx[0][Raw].load.decode('utf-8'))

		
if __name__ == "__main__":
    main()
