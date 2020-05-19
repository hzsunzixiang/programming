#!/usr/bin/env python3
# -*- coding:UTF-8
#coding=gbk


from urllib import request, parse

url = "http://www.baidu.com"

data = {'test1': 10, 'test2': 20}
data = parse.urlencode(data).encode()

req = request.Request(url, data=data)
response = request.urlopen(req)

print (response.read())
