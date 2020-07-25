#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json
import datetime
#hosts = [{'host_asset': 'TYSV190929LN', 'host_sn': '2102312NFL10KA000765', 'host_ip': '10.22.1.5'}, {'host_asset': 'TYSV190929M2', 'host_sn': '2102312NFL10KA000742', 'host_ip': '10.22.1.7'}, {'host_asset': 'TYSV190929N4', 'host_sn': '2102312NFL10KA000748', 'host_ip': '10.22.1.9'}]

#volume = [ { "imgId": "img2020030807930426", "partitionType": "ROOT", "rawRootTag": "rawRootDisk", "serial": "ldisk-19wm7dzf", "size": 52, "target": "xvda", "type": "standard", "uuid": "0ca02200-4c0b-4c87-96f6-8117d6d2181b", "virtualSize": 50, "volumeType": "lvm" }, { "partitionType": "DATA", "rawRootTag": "", "serial": "ldisk-c0vp279d", "size": 10, "target": "xvdb", "type": "standard", "uuid": "00bbd6f2-3285-4f48-94d3-6c8a8a091305", "virtualSize": 0, "volumeType": "cbs" } ] 

volume = [ { "imgId": "img2020030807930426", "partitionType": "ROOT", "rawRootTag": "rawRootDisk", "serial": "ldisk-19wm7dzf", "size": 52, "target": "xvda", "type": "standard", "uuid": "0ca02200-4c0b-4c87-96f6-8117d6d2181b", "virtualSize": 50, "volumeType": "lvm" }, { "partitionType": "DATA", "rawRootTag": "", "serial": "ldisk-c0vp279d", "size": 10, "target": "xvdb", "type": "standard", "uuid": "00bbd6f2-3285-4f48-94d3-6c8a8a091305", "virtualSize": 0, "volumeType": "lvm" } ] 
print(volume)

volume_type  = [ n['volumeType'] for n in volume if  n['volumeType'] == "cbs"]
print(volume_type)
if volume_type:
    print("there is cbs")
else:
    print("there is no cbs")
