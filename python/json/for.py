#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json
import datetime
hosts = [{'host_asset': 'TYSV190929LN', 'host_sn': '2102312NFL10KA000765', 'host_ip': '10.22.1.5'}, {'host_asset': 'TYSV190929M2', 'host_sn': '2102312NFL10KA000742', 'host_ip': '10.22.1.7'}, {'host_asset': 'TYSV190929N4', 'host_sn': '2102312NFL10KA000748', 'host_ip': '10.22.1.9'}]

print(hosts)

x = [ n['host_ip'] for n in hosts]
print(x)
