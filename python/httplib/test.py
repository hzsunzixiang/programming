#!/usr/bin/env python3
import json
x={
        'Action': 'ImportImage',
        'Version': '3.00',
        'AppId': 251001482,
        'Region': 'ap-guangzhou',
        "Uin": "3178015736",
        'SubAccountUin': '3178015736',
        'Architecture': 'x86_64',
        'OsType': 'CentOS',
        'OsVersion': 6.5,
        'ImageName': 'vmImport',
        'ImageDescription': 'vmImport test',
        'ImageUrl':'http://111-1251233127.cosd.myqcloud.com/Windows%20Server%202008%20R2%20x64a.vmdk'
}# -*- coding:UTF-8

y=json.dumps(x)
print(y)
