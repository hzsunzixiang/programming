#!/usr/bin/env python3
import json
#x= '{"Response":{"TaskSet":[{"TaskId":"646680","ErrorMessage":""}],"RequestId":"8f0ef5ed-d578-4b40-8e9a-4d92a8941413"}}'
##y=json.dumps(x)
#y=json.loads(x)
#print(y)
#print(y["Response"]["TaskSet"])
#print(y["Response"]["TaskSet"][0]["TaskId"])


filter = {}
filters = []
filter["Name"] = "image-id"
filter["Values"] = "image_xyz" 
filters.append(filter)

data = {}
data["Filters"]= filters
data["Limit"]= 2
data["Offset"]= 0


print(data)
