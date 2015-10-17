#!/bin/bash
#

iptables -t mangle -A OUTPUT -p tcp --dport 1046  -j DSCP --set-dscp 43
