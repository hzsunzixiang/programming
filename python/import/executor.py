#!/usr/bin/env python
#-*- coding: utf-8 -*-

'''
执行模块的进程
'''
import sys
import os
import time

def _init():
    '''初始化路径
    @return: None'''
    for path in  ['./modules']:
        if path not in sys.path:
            sys.path.append(path)
_init()


#def main():
#    '''插件进程入口
#    @return: None'''
#    sys.path.append('./modules')
#    module = __import__("FLOW")
#    #from FLOW import flow
#    callback = module.handler
#    key = 'FLOW'
#    run_executor(key, callback, overhear=False)
#    #if module_name == 'DEBUG':
#    #    key = 'DEBUG'
#    #    run_executor(key, callback, overhear=True)
#    #else:
#    #    key = 'FLOW'
#    #    run_executor(key, callback, overhear=False)

def main():
    '''插件进程入口
    @return: None'''
    argv_len = len(sys.argv)
    if argv_len <= 2:
        print 'Usage: %s $module $key' % sys.argv[0]
        print 'Usage: %s DEBUG $key1 [$key2 [..]]' % sys.argv[0]
        return
    module_name = sys.argv[1]
    print 'Info: %s' % sys.argv
    try:
        #from FLOW import flow
        # 注意这里 需要在相应 module 里面的 __init__.py文件中写入
        # from flow import handler
        # 否则就需要在这里写入
        module = __import__(module_name)
        callback = module.handler
        print("callback:%s"%(callback))
    except Exception, inst:
        print 'Error: retrive handler failed: %s' % inst
        raise inst




if __name__ == '__main__':
    main()

