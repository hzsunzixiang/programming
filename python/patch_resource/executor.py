#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
执行模块的进程
'''
import sys
import config


def _init():
    '''初始化路径
    @return: None'''
    # for path in config.MODULE_PATH:
    for path in ['./modules']:
        if path not in sys.path:
            sys.path.append(path)



def main():
    '''插件进程入口
    @return: None'''
    # module_name = 'vsresource'
    module_name = 'vsresourceCmdb'
    command_name = 'removeVmCmdb'
    try:
        module = __import__(module_name)
        callback = module.handler
    except Exception as inst:
        print('Error: retrive handler failed: %s' % inst)
        raise inst

    print(callback)
    callback(module_name, command_name, "data_content")
    # callback = 'test'
    # eval(callback)()


if __name__ == '__main__':
    _init()
    print(dir())
    main()
