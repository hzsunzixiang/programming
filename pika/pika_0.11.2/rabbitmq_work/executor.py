#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
执行模块的进程
'''
import sys
import os
import time
import mq
from callback_adapter import mq_callback_adapter
from pika.exceptions import AMQPError, AMQPConnectionError

# 当前重连次数
retry_times = 0

# 最大重连次数
MAX_RETRY = 10000


class CallbackError(Exception):
    '回调函数执行时抛出的异常'
    pass


def _init():
    '''初始化路径
    @return: None'''
    for path in ['./modules']:
        if path not in sys.path:
            sys.path.append(path)


_init()

# retry_publish_para 不为None，说明有消息要发送
def run_executor(key, callback, overhear=False, retry_publish_para=None):
    '''插件进程执行函数
    @param key: 模块监听的队列
    @type key: str
    @param callback: 模块收到消息时执行的回调函数
    @type callback: callable object
    @param overhear: 是否为overhear模式
    @type overhear: bool
    @return: None'''

    def _reconnect():
        print 'Info: try reconnect...'
        global retry_times
        if retry_times >= MAX_RETRY:
            print 'Error: retry too many times!'
            return
        retry_times += 1
        time.sleep(5)
        run_executor(key, callback, overhear, retry_publish_para)

    if overhear:
        listen_fun = 'overhear'
    else:
        listen_fun = 'listen'
    print 'Executor Run...'
    # Step1: 适配回调函数
    try:
        # 参数为业务模块中的 callback : args=['module', 'command', 'params']
        # 返回之后即为 callback_adapter 中的 callback
        # 在这里 callback 的含义发生变化，从 3个参数，变为 4个参数
        callback = mq_callback_adapter(key, callback, overhear)
    # 返回到这里的时候，callback就发生了变换, 变成了 mq_callback_adapter.mq_cb
    # (Pdb) print callback
    # <function mq_cb at 0x7f089f513500>
    # (Pdb) inspect.getargspec(callback)
    # ArgSpec(args=['channel', 'method', 'properties', 'body'], varargs=None, keywords=None, defaults=None)

    # 此时的callback 即为 适合MQ调用的 callback
    except CallbackError, inst:
        print 'Error: transfer callback[%s] failed: %s' % (callback, inst)
    except Exception, inst:
        print 'Fatal: transfer callback[%s] failed: %s' % (callback, inst)

    # Step2: 连接到RabbitMQ
    try:

        exchange = 'vstation'
        vhost = 'vstation'
        user = 'vstation'
        password = 'vstation'
        queue_name = 'FLOW'
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

    # 发送未成功消息
    # mq_conn.channel 重试 publish
    if isinstance(retry_publish_para, dict):
        print("try publish: channel.basic_publish................")
        time.sleep(10)
        print("try publish: channel.basic_publish: exchange:%s, routing_key:%s,body:%s " % (
            retry_publish_para["exchange"], retry_publish_para["routing_key"], retry_publish_para["body"]))
        try:

            ret = mq_conn.channel.basic_publish(exchange=retry_publish_para["exchange"],
                                                routing_key=retry_publish_para["routing_key"],
                                                body=retry_publish_para["body"],
                                                properties=retry_publish_para["properties"])
            print "try publish: publish msg  to MQ, next_module ret:[%s]"%(ret, )
        except Exception, e:
            import traceback
            print(traceback.format_exc())
            print('create mq except %s' % e)
            return _reconnect()
    else:
        print("retry_publish_para is None or not dict")
        # Step3: wait or die alone
    try:
        print("getattr(mq_conn, listen_fun)(key, callback)........")
        # (Pdb) print mq_conn
        # <mq.RMQ object at 0x7f089f50cf90>
        # (Pdb) print(dir(mq_conn))
        # ['__class__', '__del__', '__delattr__', '__dict__', '__doc__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_consuming', '_declare_exchange', '_declare_queue_with_key', '_get_server', 'channel', 'conn', 'count', 'exchange', 'listen', 'overhear', 'recv', 'run_flag', 'send', 'stop', 'stop_fun']

        # (Pdb) print key
        # FLOW
        # (Pdb) print callback
        # <function mq_cb at 0x7f089f513500>
        # (Pdb) print getattr(mq_conn, listen_fun)
        # <bound method RMQ.listen of <mq.RMQ object at 0x7f089f50cf90>>
        # 在这里阻塞等待消息触发
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
    # from FLOW import flow
    # callback = flow.handler
    module = __import__("FLOW")
    # 这里的callback是组件的入口  args=['module', 'command', 'params']
    callback = module.handler
    key = 'FLOW'
    run_executor(key, callback, overhear=False)
    # if module_name == 'DEBUG':
    #    key = 'DEBUG'
    #    run_executor(key, callback, overhear=True)
    # else:
    #    key = 'FLOW'
    #    run_executor(key, callback, overhear=False)


if __name__ == '__main__':
    main()

# (Pdb) n
# > /home/ericksun/programming/pika/pika_0.11.2/rabbitmq_work/executor.py(128)main()
# -> run_executor(key, callback, overhear=False)
# (Pdb) print key
# FLOW
# (Pdb) print callback
# <function handler at 0x7f089f5131b8>
# (Pdb) break module.handler
# Breakpoint 3 at /home/ericksun/programming/pika/pika_0.11.2/rabbitmq_work/modules/FLOW/flow.py:5
# (Pdb) import inspect
# (Pdb) inspect.getargspec(callback)
# ArgSpec(args=['module', 'command', 'params'], varargs=None, keywords=None, defaults=None)
