#!/usr/bin/env python
#-*- coding: utf-8 -*-

'''
回调函数的相关实现，包含一个从hander到真实pika接受的回调函数
'''
import os
import time
import inspect
import traceback


def mq_callback_adapter(callback):
    '''回调函数装饰器, 将模块定义的回调函数转化为pika的回调函数。
    @param callback: 模块自定义的回调函数
    @type callback: 函数对象
    @return: 装饰后可作为pika consume时回调的函数对象

        >>> def user_callback(module, command, data): pass
        ...
        >>> callback1 = mq_callback_adapter(user_callback)
        >>> callback1 == user_callback
        False
        >>> callback2 = mq_callback_adapter(callback1)
        >>> callback2 == callback1
        True
        >>> def error_callback(module, command): pass
        ...
        >>> callback3 = mq_callback_adapter(error_callback)
        Traceback (most recent call last):
            ...
        CallbackError: handler is invalid
    '''
    # 这里才是真正体现 MQ的参数的地方 
    # 这样可以不用把各参数暴露给外面
    def mq_cb(channel, method, properties, body):
        print " [x] Received %r, ch:%s method:%s, properties:%s" % (body, channel, method, properties)

        class Namespace(object): pass
        ns = Namespace()

        '实际的被回调的函数'
        ns.msg           = None

        def load_msg(body):
            print 'load msg'
            try:
                # 在这里可以对body进行各种处理
                # 这里载入消息之后从body中可以解析出所有信息，包括 模块名等
                # ns.msg 包含了所有信息
                # 这里只是简单的模拟，加入已经解析出来
                ns.msg = body
                ns.key = "FLOW"
            except Exception as e:
                print e
                print traceback.format_exc()

        def callback_exec():
            try:
			    print("the callback body%s"%(ns.msg))
            except Exception as e:
                print traceback.format_exc()
        def callback_exec():
            msg = ns.msg
            key = ns.key
            try:
                print "callback exec"
                args_len = len(inspect.getargspec(callback).args)
                if args_len == 3:
                    ret = callback(key, "FLOW_COMMAND", msg)
            except Exception as e:
                print traceback.format_exc()
                error_msg = "taskId[%s] cursor[%s] callback exec Exception" % (msg.msgid, msg.cursor)
                print error_msg

        try:
            load_msg(body)                    # 构建消息结构体
            callback_exec()                 # 执行业务逻辑
        except Exception, inst:
            print traceback.format_exc()

        finally:
		    pass

    # 函数的入口处，上面都是函数定义
    args_len = len(inspect.getargspec(callback).args)
    # 对应的是业务模块的这个 callback:  def handler(module, command, params):
    print("args_len %s"%(args_len))
    if args_len in (3, 5):
        return mq_cb
    else:
        raise CallbackError('handler is invalid')


