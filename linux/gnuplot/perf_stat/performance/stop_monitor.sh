#!/bin/sh

#ps ux | grep 'vmstat -n' | grep -v grep | awk '{print $2}' | xargs kill
#ps ux | grep 'iostat -d -xm' | grep -v grep | awk '{print $2}' | xargs kill
#ps ux | grep 'iostat -d' | grep -v grep | awk '{print $2}' | xargs kill
#ps ux | grep 'sar -n DEV' | grep -v grep | awk '{print $2}' | xargs kill
#ps ux | grep 'top -p' | grep -v grep | awk '{print $2}' | xargs kill
killall pidstat
sudo killall tcpdump
