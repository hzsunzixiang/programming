#!/usr/bin/env python3
import json

volume =  '[ { "uuid": "0012315412545", "imgId": "img2017022018822677", "serial": "", "partitionType": "ROOT", "type": "cbs", "size": 22 }, { "uuid": "0012315412544", "imgId": "", "serial": "cbs-0c3i3zrz", "partitionType": "DATA", "type": "cbs", "size": 20 } ]'

print(json.loads(volume))

volumes = json.loads(volume)

for volume in (volume for volume in volumes if volume["partitionType"]=="ROOT"):
    print(volume)
for volume in (volume for volume in volumes if volume["partitionType"]=="ROOT"):
    reset_size_compare = volume.get("size")


reset_size_compare = [volume['size'] for volume in volumes if volume["partitionType"] == "ROOT"][0]

print(reset_size_compare)


uuid_list = []
uuid_list.append("mmmmmmmmmmmmmmmmmmm")
print(uuid_list)

exit(0)
list_a = []
print([].append("xxxxxxx"))
print(list_a.append("xxxxxxx"))
print(list_a)


#a = [2,3,4,5,6,7,8,9,0]
#xyz = [0,12,4,6,242,7,9]
#
#for x in (x for x in xyz if x not in a):
#    print(x)

