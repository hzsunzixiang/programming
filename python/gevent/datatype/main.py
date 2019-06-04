#!/usr/bin/env python3
# -*- coding:UTF-8


white_set = {"purchaseSource", "Region", "Action", "Nonce", "Version", "Timestamp", "SecretId", "Signature",
             "ApiModule", "AppId", "Uin", "Level", "RequestOperator", "regionId", "SubAccountUin",
             "regionIdForTrade", "RequestId", "RequestClient", "ClientIp", "Ip", "Token", "seqId", "spanId", "interface",
             "RequestSource", "RequestFromApi", "Business", "productInfo", "productInfos", "SignatureMethod", "Language",
             "AssumerUin", "CurrentTime", "ApiAction"}

def get_path_point(_point, path_str="", zero=False):
    """
    通过一个指针，通过指定的path得到新指针，未来可以查表化。
    """
    print("get_path_point {%s}#####{%s}"%(path_str, _point))
    if not path_str:
        return _point
    p = [int(i) if i.isdigit() else i for i in path_str.split('.') if i]
    for i in p:
        if isinstance(_point, list):
            _point = _point[0 if zero else int(i)]
        else:
            _point = _point[i]
    return _point

class MetaDataType(type):

    def __new__(mcs, name, bases, dct):
        _ = [(k, v) for k, v in list(dct.items())
             if '__' not in k and k not in attrs_whitelist]
        dct['attrs'] = {}
        for k, v in _:
            dct['attrs'][k] = v

        return type.__new__(mcs, name, bases, dct)



white_set = {"purchaseSource", "Region", "Action", "Nonce", "Version", "Timestamp", "SecretId", "Signature",
             "ApiModule", "AppId", "Uin", "Level", "RequestOperator", "regionId", "SubAccountUin",
             "regionIdForTrade", "RequestId", "RequestClient", "ClientIp", "Ip", "Token", "seqId", "spanId", "interface",
             "RequestSource", "RequestFromApi", "Business", "productInfo", "productInfos", "SignatureMethod", "Language",
             "AssumerUin", "CurrentTime", "ApiAction"}


class DataType(object, metaclass=MetaDataType):
    """基本DataType"""
    pass
class String(DataType):
    """字符串类型"""
    pass


#[2019-06-14 11:22:24,142] [9ff4dc81-8f04-47fc-9467-ea59123d154d][bone.py schema_core_loop 345]ericksun _rule##{'InstanceIds': [<framework.prototype.datatype.String object at 0x7f160d333518>], 'Filters': [<framework.prototype.datatype.Filter object at 0x7f160d333470>], 'Offset': <framework.prototype.datatype.Integer object at 0x7f160d333390>, 'Limit': <framework.prototype.datatype.Integer object at 0x7f160d3332e8>, 'InnerVpcIds': [<framework.prototype.datatype.Integer object at 0x7f160d333080>], 'InnerSubnetIds': [<framework.prototype.datatype.Integer object at 0x7f160d3335c0>], 'IpAddresses': [<framework.prototype.datatype.String object at 0x7f160d333438>], 'VagueIpAddress': <framework.prototype.datatype.String object at 0x7f160d3332b0>, 'VagueInstanceName': <framework.prototype.datatype.String object at 0x7f160d367fd0>}####, _data{'Offset': 0, 'Limit': 1, 'Action': 'DescribeInstances', 'AppId': 1255000010, 'Uin': '100004603013', 'SubAccountUin': '100004603013', 'ClientIp': '192.168.251.35', 'Region': 'chongqing', 'Version': '2017-03-12', 'RequestSource': 'MC', 'Language': 'zh-CN'}


_point= {'AppId': String(), 'Uin': String(), 'SubAccountUin': String(), 'Region': String(), 'Token': String(), 'ClientIp': String, 'Language': String(), 'AssumerUin': String()}

data={'Offset': 0, 'Limit': 1, 'Action': 'DescribeInstances', 'AppId': 1255000010, 'Uin': '100004603013', 'SubAccountUin': '100004603013', 'ClientIp': '192.168.251.35', 'Region': 'chongqing', 'Version': '2017-03-12', 'RequestSource': 'MC', 'Language': 'zh-CN'}

_rule=get_path_point(_point)
_data=get_path_point(data)
if not isinstance(_rule, dict):
    print("not dict")
print("--------------------")
print(_rule)
print(set(_rule))

print("--------------------")
print(_data)
print(set(_data))
print("--------------------")


user_ext_input = [i for i in set(_data) - set(_rule)]
print(user_ext_input)
user_ext_input = [i for i in set(_data) - set(_rule) - white_set if '_' not in i]
print(user_ext_input)
user_ext_input = [i for i in set(_rule) - set(_data)]
print(user_ext_input)



print("######################")

user_ext_input = [i for i in (set(_data) - set(_rule))]
print(user_ext_input)

user_ext_input = [set(_data) - set(_rule)]
print(user_ext_input)

print("######################")
user_ext_input = [i for i in set(_data) - set(_rule) - white_set if '_' not in i]
print(user_ext_input)

undefined_key = list(user_ext_input)[0]
print(undefined_key)





