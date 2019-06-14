#!/usr/bin/env python3
# coding=utf-8
import six

# 原地址
# https://programtalk.com/python-examples/six.iterkeys/?ipage=4
def convert_dicts_to_lists(args):
    """
    转换具有数字key的字典到列表。
    """
    print('ericksun convert_dicts_to_lists args: %s' % (args))

    if not isinstance(args, dict):
        return args
    for key in args.keys():
        if isinstance(args[key], dict):
            if args[key] == {}:
                continue
            first_subkey = next(six.iterkeys(args[key]))
            print('ericksun convert_dicts_to_lists first_subkey: %s' % (first_subkey))
            if isinstance(first_subkey, int) or first_subkey.isdigit():
                s = args[key]
                args[key] = [convert_dicts_to_lists(s[k])
                             for k in sorted(s)]
            # elif (first_subkey == 'value' and
            #        len(args[key]) == 1):
            #    args[key] = args[key]['value']
            else:
                s = args[key]
                args[key] = convert_dicts_to_lists(s)
        if isinstance(args[key], list):
            args[key] = [convert_dicts_to_lists(i) for i in args[key]]
    print('ericksun convert_dicts_to_lists args: %s' % (args))
    return args

args= {'AppId': 1255000010, 'Uin': '100004603013', 'SubAccountUin': '100004603013', 'Region': 'chongqing', 'ClientIp': '192.168.251.35', 'Language': 'zh-CN', 'InstanceIds': {0: 'ins-o859cu3f', 1: 'ins-f1pp8fpb'}, 'Offset': 0, 'Limit': 1}

print(convert_dicts_to_lists(args))


#ericksun convert_dicts_to_lists args: {'ClientIp': '192.168.251.35', 'Offset': 0, 'SubAccountUin': '100004603013', 'Language': 'zh-CN', 'Region': 'chongqing', 'Uin': '100004603013', 'InstanceIds': ['ins-o859cu3f', 'ins-f1pp8fpb'], 'Limit': 1, 'AppId': 1255000010}
#{'ClientIp': '192.168.251.35', 'Offset': 0, 'SubAccountUin': '100004603013', 'Language': 'zh-CN', 'Region': 'chongqing', 'Uin': '100004603013', 'InstanceIds': ['ins-o859cu3f', 'ins-f1pp8fpb'], 'Limit': 1, 'AppId': 1255000010}


#[2019-06-14 17:25:03,684] [5ce42c3f-5b1f-460a-b737-621e5a3f30e4][bone.py convert_dicts_to_lists 47]ericksun convert_dicts_to_lists args: {'AppId': 1255000010, 'Uin': '100004603013', 'SubAccountUin': '100004603013', 'Region': 'chongqing', 'ClientIp': '192.168.251.35', 'Language': 'zh-CN', 'InstanceIds': {0: 'ins-o859cu3f', 1: 'ins-f1pp8fpb'}, 'Offset': 0, 'Limit': 1}
#[2019-06-14 17:25:03,684] [5ce42c3f-5b1f-460a-b737-621e5a3f30e4][bone.py convert_dicts_to_lists 47]ericksun convert_dicts_to_lists args: ins-o859cu3f
#[2019-06-14 17:25:03,684] [5ce42c3f-5b1f-460a-b737-621e5a3f30e4][bone.py convert_dicts_to_lists 47]ericksun convert_dicts_to_lists args: ins-f1pp8fpb
#[2019-06-14 17:25:03,684] [5ce42c3f-5b1f-460a-b737-621e5a3f30e4][bone.py convert_dicts_to_lists 47]ericksun convert_dicts_to_lists args: ins-o859cu3f
#[2019-06-14 17:25:03,684] [5ce42c3f-5b1f-460a-b737-621e5a3f30e4][bone.py convert_dicts_to_lists 47]ericksun convert_dicts_to_lists args: ins-f1pp8fpb
#[2019-06-14 17:25:03,684] [5ce42c3f-5b1f-460a-b737-621e5a3f30e4][bone.py convert_dicts_to_lists 67]ericksun convert_dicts_to_lists args: {'AppId': 1255000010, 'Uin': '100004603013', 'SubAccountUin': '100004603013', 'Region': 'chongqing', 'ClientIp': '192.168.251.35', 'Language': 'zh-CN', 'InstanceIds': ['ins-o859cu3f', 'ins-f1pp8fpb'], 'Offset': 0, 'Limit': 1}
#


#    def convert_dicts_to_lists(args):
#        if not isinstance(args, dict):
#            return args
#        for key in args.keys():
#            # NOTE(vish): Turn numeric dict keys into lists
#            # NOTE(Alex): Turn "value"-only dict keys into values
#            if isinstance(args[key], dict):
#                if args[key] == {}:
#                    continue
#                first_subkey = next(six.iterkeys(args[key]))
#                if first_subkey.isdigit():
#                    s = args[key]
#                    args[key] = [convert_dicts_to_lists(s[k])
#                                 for k in sorted(s)]
#                elif (first_subkey == 'value' and
#                        len(args[key]) == 1):
#                    args[key] = args[key]['value']
#        return args
# 
#    args = convert_dicts_to_lists(args)
#    result = method(context, **args)
#    return self._render_response(result, context.request_id)

