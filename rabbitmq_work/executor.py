#!/usr/bin/env python
#-*- coding: utf-8 -*-

'''
执行模块的进程
'''
import sys
import os
import time
import mq
from callback_adapter import mq_callback_adapter
from pika.exceptions import AMQPError, AMQPConnectionError
import callback_adapter


# 当前重连次数
retry_times = 0

# 最大重连次数
MAX_RETRY = 10000


def _init():
    '''初始化路径
    @return: None'''
    for path in  ['./modules']:
        if path not in sys.path:
            sys.path.append(path)
_init()

def run_executor(key, callback, overhear=False):
    '''插件进程执行函数
    @param key: 模块监听的队列
    @type key: str
    @param callback: 模块收到消息时执行的回调函数
    @type callback: callable object
    @param overhear: 是否为overhear模式
    @type overhear: bool
    @return: None'''

    if overhear:
        listen_fun = 'overhear'
    else:
        listen_fun = 'listen'
    print 'Executor Run...'
    # Step1: 适配回调函数
    try:
        # 参数为业务模块中的 callback
        # 返回之后即为 callback_adapter 中的 callback
        callback = mq_callback_adapter(callback)
        # 此时的callback 即为 适合MQ调用的 callback
    except CallbackError, inst:
        print 'Error: transfer callback[%s] failed: %s' % (callback, inst)
    except Exception, inst:
        print 'Fatal: transfer callback[%s] failed: %s' % (callback, inst)

    # Step2: 连接到RabbitMQ
    try:

        exchange = 'vstation'
        vhost = 'vstation'
        user =  'vstation'
        password = 'vstation'
        queue_name =  'FLOW'
        mq_conn = mq.RMQ(server="127.0.0.1:5672",
                         exchange=exchange,
                         virtual_host=vhost,
                         username=user,
                         password=password)

    except AMQPConnectionError, inst:
        print 'Error: ConnectionError: %s' % inst
        return _reconnect()
    except AMQPError, inst:
        print 'Error: connect MQ failed: %s' % inst
        raise inst
    except Exception, inst:
        print 'Fatal: connect MQ failed: %s' % inst
        raise inst

    # Step3: wait or die alone
    try:
        getattr(mq_conn, listen_fun)(key, callback)
    except AMQPError, inst:
        print 'Error: ConnectionError: %s' % inst
        return _reconnect()
    except Exception, inst:
        import traceback
        print traceback.format_exc()
        print 'Fatal: callback error: %s' % inst
    finally:
        import traceback
        print traceback.format_exc()
        print 'Info: callback finally message done'

    print 'Info: Executor done...'


def main():
    '''插件进程入口
    @return: None'''
    sys.path.append('./modules')
    #from FLOW import flow
    #callback = flow.handler
    module = __import__("FLOW")
    callback = module.handler
    key = 'FLOW'
    run_executor(key, callback, overhear=False)
    #if module_name == 'DEBUG':
    #    key = 'DEBUG'
    #    run_executor(key, callback, overhear=True)
    #else:
    #    key = 'FLOW'
    #    run_executor(key, callback, overhear=False)


if __name__ == '__main__':
    main()

