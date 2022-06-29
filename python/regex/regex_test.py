#!/usr/bin/env python
#-*- coding: utf-8 -*-

'''
执行模块的进程
'''
import sys
import os
import time

#3d:02.0 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:02.1 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:02.2 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:02.3 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:02.4 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:02.5 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:02.6 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:02.7 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.0 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.1 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.2 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.3 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.4 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.5 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.6 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)
#3d:06.7 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)

# 10.27.4.16
#41:00.1 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
#41:00.2 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
#41:00.3 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
#41:00.4 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
#41:00.5 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
#41:00.6 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
#41:00.7 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
#41:01.0 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]


import re

string_1="3d:02.0 Ethernet controller [0200]: Intel Corporation Ethernet Virtual Function 700 Series [8086:37cd] (rev 09)"
string_2="41:00.1 Ethernet controller [0200]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]"

pciePattern = re.compile(r'\[[0-9a-fA-F]{4}:[0-9a-fA-F]{4}\]')
m = re.search(pciePattern, string_1)
if m:
   print("found a match:", m.group(0))

m = re.search(pciePattern, string_2)
if m:
   print("found a match:", m.group(0))

#txt = "The rain in Spain"
#x = re.search(r"\bS\w+", txt)
#print(x.group())





































