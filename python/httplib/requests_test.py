#!/usr/bin/env python3
# -*- coding:UTF-8
#coding=gbk


#https://python3-cookbook.readthedocs.io/zh_CN/latest/c11/p01_interact_with_http_services_as_client.html

import json
import requests

# Base URL being accessed
url = 'http://httpbin.org/post'

# Dictionary of query parameters (if any)
parms = {
   'name1' : 'value1',
   'name2' : 'value2'
}

# Extra headers
headers = {
    'User-agent' : 'none/ofyourbusiness',
    'Spam' : 'Eggs'
}

resp = requests.post(url, data=parms, headers=headers)

# Decoded text returned by the request
text = resp.text

print(text)
