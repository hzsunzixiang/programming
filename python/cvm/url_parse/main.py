#!/usr/bin/env python3
# coding=utf-8
import urllib
import requests

def dict_from_dotted_str(raw_str):
    items = urllib.parse.parse_qs(raw_str)

    args = {}
    for key, value in items.items():
        if isinstance(value, list) and len(value) == 1:
            items[key] = value[0]

    for key, value in items.items():
        parts = key.split(".")
        key = str(parts[0])
        if isinstance(value, str):
            # NOTE(vish): Automatically convert strings back
            #             into their respective values
            #value = _try_convert(value)

            if len(parts) > 1:
                d = args.get(key, {})
                args[key] = d
                for k in parts[1:-1]:
                    k = k
                    v = d.get(k, {})
                    d[k] = v
                    d = v
                d[parts[-1]] = value
            else:
                args[key] = value
    return args

raw_str="Action=DescribeInstances&Region=chongqing&AppId=1255000010&Uin=100004603013&SubAccountUin=100004603013&Version=2017-03-12&RequestSource=MC&Offset=0&Limit=2&InstanceIds.0=ins-o859cu3f&InstanceIds.1=ins-f1pp8fpb"
dict_from_dotted_str(raw_str)
print(raw_str)
