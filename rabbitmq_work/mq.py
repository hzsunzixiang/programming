#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
AMQP协议消息队列的简单封装
'''

import random
import pika


class QueueError(Exception):
    '消息队列异常'
    pass


class RMQ(object):
    '''消息队列连接
    @param server: 消息队列服务器
    @type server: None/string/list/tuple/set
    @param exchange: 消息队列的exchange
    @type exchange: str
    @param virtual_host: 消息队列的vhost
    @type virtual_host: None/str
    @param username: 消息队列的用户名
    @type username: str
    @param password: 消息队列的密码
    @type password: str
    @param by_conf: 所有配置从confg.py中导入, 以上参数将被忽略
    @type by_conf: bool
    '''

    def __init__(self, server=None, exchange='', virtual_host=None,
                 username='guest', password='guest', by_conf=False):

        host, port = self._get_server(server)
        self.exchange = exchange
        credentials = pika.PlainCredentials(username, password)
        para = pika.ConnectionParameters(host=host, port=port,
                                         virtual_host=virtual_host,
                                         socket_timeout=1,
                                         # note(dondon) 有超时情况，暂时先设置，看看效果情况
                                         credentials=credentials)
        self.conn = pika.BlockingConnection(para)
        self.channel = self.conn.channel()
        self.run_flag = 1  # 0服务需要停止 1无操作情况  2 服务工作中
        
        #self.channel.queue_declare(queue=queue_name, durable=True)  
        # 指定exchange
        #self.channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)
        

    def _get_server(self, server):
        '''从服务器列表中随机获取一个服务器
        @param server: 消息队列服务器
        @type server: string/list/tuple/set
        @return: (host, port)
        '''
        if isinstance(server, basestring):
            server = server.replace(';', ',').split(',')
        host, port = random.choice(server).split(':')
        return host, int(port)

    def __del__(self):
        '析构时断开连接'
        try:
            self.conn.close()
        except Exception:
            pass

    def send(self, key, message, declare=False, expiration=None):
        '''往指定的key上发送消息
        @param key: key
        @type key: str
        @param message: 消息
        @type message: str
        @param declare: 是否declare队列
        @type declare: bool
        @param expiration: 超时时间
        @type expiration: None/int/str'''
        if declare:
            self._declare_exchange()
            self._declare_queue_with_key(key)
        if isinstance(expiration, int):
            expiration = str(expiration)
        properties = pika.BasicProperties(delivery_mode=2,
                                          expiration=expiration)
        self.channel.basic_publish(exchange=self.exchange, routing_key=key,
                                   body=message, properties=properties)

    def listen(self, key, callback, no_ack=False):
        '''监听指定的key对应的固定的queue
        @param key: key
        @type key: str
        @param callback: 回调函数
        @type callback: 可调用对象
        @param no_ack: 队列不需要ack接收消息
        @type no_ack: bool'''
        self._declare_exchange()
        self._declare_queue_with_key(key)
        self._consuming(callback, key, no_ack)

    def overhear(self, keys, callback, no_ack=False):
        '''旁路监听指定的key列表
        @param keys: key列表
        @type keys: str/list/tuple/set
        @param callback: 回调函数
        @type callback: 可调用对象
        @param no_ack: 队列不需要ack接收消息
        @type no_ack: bool'''
        self._declare_exchange()
        queue = self.channel.queue_declare(exclusive=True, durable=True)
        queue_name = queue.method.queue
        if isinstance(keys, basestring):
            keys = [keys]
        for key in keys:
            self.channel.queue_bind(exchange=self.exchange,
                                    queue=queue_name, routing_key=key)
        self._consuming(callback, queue_name, no_ack)

    def stop(self):
        '停止监听'
        self.channel.stop_consuming()

    def stop_fun(self):
        '获取停止监听的函数对象'

        def _stop():
            if self.run_flag == 2:
                self.run_flag = 0
                self.stop()
            elif self.run_flag == 0:
                print 'run_flag already 0, may by task is running'
                self.stop()
            else:
                import sys
                sys.exit(0)

        return _stop

    def recv(self, key):
        '''简单收取, 若队列上无消息会抛出异常
        @param key: key
        @type key: str
        @return: (method, header, body)'''
        method, header, body = self.channel.basic_get(key)
        if method:
            self.channel.basic_ack(delivery_tag=method.delivery_tag)
        return method, header, body

    def _declare_exchange(self):
        self.channel.exchange_declare(exchange=self.exchange,
                                      durable=True)

    def _declare_queue_with_key(self, key):
        self.channel.queue_declare(queue=key, durable=True,
                                   arguments={'x-ha-policy': 'all'})
        self.channel.queue_bind(exchange=self.exchange,
                                queue=key, routing_key=key)

    def count(self, key):
        return self.channel.queue_declare(queue=key, passive=True)

    def _consuming(self, callback, queue, no_ack):
        self.channel.basic_qos(prefetch_count=1)
        #self.channel.basic_consume(callback, queue=queue, no_ack=no_ack)
        # 特别注意这里的熟顺序，跟 pika版本有关系
        # auto_ack = True 很关键，不然一直不消费
        self.channel.basic_consume(queue, callback, auto_ack=True)

        try:
            self.run_flag = 2
            self.channel.start_consuming()
        except IOError:
            # File "pika/adapters/select_connection.py", line 590, in poll
            #     events = self._poll.poll(self.get_next_deadline())
            # IOError: [Errno 4] Interrupted system call

            # blocking for mq message, when receive signal, it will raise IOError

            if self.run_flag == 0:
                # receive stop signal
                print('service received STOP signal, stop consume')
            else:
                raise

        # http://bugs.python.org/issue17097
        # IOError: [Errno 4] Interrupted system call
        # Python3.3 solve it
        # while len(self.channel._consumer_infos) and self.run_flag:
        #     self.run_flag = 2
        #     self.channel.connection.process_data_events()

