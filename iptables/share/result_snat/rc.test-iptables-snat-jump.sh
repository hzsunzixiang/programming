#!/bin/bash
#
# rc.test-iptables - test script for iptables chains and tables.
#
# Copyright (C) 2001  Oskar Andreasson <bluefluxATkoffeinDOTnet>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program or from the site that you downloaded it
# from; if not, write to the Free Software Foundation, Inc., 59 Temple
# Place, Suite 330, Boston, MA  02111-1307   USA
#


ip=`facter |grep "ipaddress_eth0"|awk '{print $3}'`
#
# NAT table, all chains except OUTPUT which don't work.
#
iptables -t nat -N LOG_SNAT
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o eth0 -j LOG_SNAT
iptables -t nat -A LOG_SNAT -j LOG --log-prefix "snat_allow  "
iptables -t nat -A LOG_SNAT -j SNAT --to-source $ip
#iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to-source 194.236.50.155-194.236.50.160:1024-32000 

