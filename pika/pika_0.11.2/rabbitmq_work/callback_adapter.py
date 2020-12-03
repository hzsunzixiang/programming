#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
回调函数的相关实现，包含一个从hander到真实pika接受的回调函数
'''
import os
import time
import inspect
import traceback
from pika.exceptions import AMQPError, AMQPConnectionError, ChannelClosed, AMQPChannelError


class CallbackError(Exception):
    '回调函数执行时抛出的异常'
    pass


def mq_callback_adapter(key, callback, overhear):

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


    def decompress_cb(channel, method, properties, body):
        """
        给其他的没有mq_cb的其他模块进行解压缩操作。
        :param channel:
        :param method:
        :param properties:
        :param body:
        :return:
        """
        # 这里没有返回值，直接使用channel进行向MQ ack数据
        callback(channel, method, properties, body)


    # 这里才是真正体现 MQ的参数的地方
    # 这样可以不用把各参数暴露给外面
    def mq_cb(channel, method, properties, body):
        #print " [x] Received %r, ch:%s method:%s, properties:%s" % (body, channel, method, properties)
        print " [x] Received %r,   method:%s " % (body,  method )
        class Namespace(object):
            pass

        ns = Namespace()

        '实际的被回调的函数'
        ns.msg = None

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
                print("the callback body%s" % (ns.msg))
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
            load_msg(body)  # 构建消息结构体
            callback_exec()  # 执行业务逻辑
        except Exception, inst:
            import traceback
            print traceback.format_exc()
        finally:
            try:
                channel.basic_ack(delivery_tag=method.delivery_tag)
            except AMQPError, inst:
                print('Error: AMQPError:  %s' % (inst,))
                raise
            except Exception, e:
                print(traceback.format_exc())
                raise
            print('channel.basic_ack success, will publish to next queue')
            # 如果 ACK成功，但是下面这个失败，需要重试
            time.sleep(10)
            try:
                print("channel.basic_publish: exchange:%s, properties:%s"%(method.exchange, properties))
                ret = channel.basic_publish(exchange=method.exchange,
                                            routing_key="ericksun_test",
                                            body="Hello,China" + str(time.time()),
                                            properties=properties)
                print "publish msg  to MQ, next_module ret:[%s]"%(ret, )
            except Exception, e:
                import traceback
                print(traceback.format_exc())
                print('publish msg  to MQ failed, except %s' % e)
                retry_publish_para = {"exchange":method.exchange, "routing_key":"ericksun_test", "body":"Hello,China" + str(time.time()), "properties": properties }
                from executor import run_executor
                run_executor(key, callback_origin, overhear, retry_publish_para)
            time.sleep(2)

    # 函数的入口处，上面都是函数定义
    # 这里的callback可能是是重连之后的callback，也可能是入口的callback, 需要根据参数个数匹配
    args_len = len(inspect.getargspec(callback).args)
    # 对应的是业务模块的这个 callback:  def handler(module, command, params):
    print("args_len %s, inspect.getargspec(callback).args: %s" % (args_len, inspect.getargspec(callback).args))
    if args_len == 4:
        # 重连的时候走的是这里的逻辑
        return decompress_cb
    if args_len in (3, 5):
        # 保留原始的callback函数，重连的时候需要
        callback_origin = callback
        return mq_cb
    else:
        raise CallbackError('handler is invalid')
