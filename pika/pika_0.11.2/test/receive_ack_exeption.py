#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import signal
from pika.exceptions import AMQPError, AMQPChannelError, ChannelClosed

exchange = 'vstation'
vhost = 'vstation'
user = 'vstation'
password = 'vstation'
queue_name = 'TEST_DUP'
host = '10.28.0.142'
# heartbeat = 87600
signal.signal(signal.SIGPIPE, signal.SIG_IGN)
credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
    host=host,
    virtual_host=vhost,
    # heartbeat=heartbeat,
    credentials=credentials))

channel = connection.channel()
result = channel.queue_declare(queue=queue_name, durable=True)

queue_name = result.method.queue
print('queue_name:' + queue_name)

# 指定exchange
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

# 这一句很重要，否则不生效
channel.queue_bind(exchange=exchange, queue=queue_name)

print(' [*] Waiting for messages. To exit press CTRL+C')

import time


# class ChannelClosed(AMQPChannelError):
# class AMQPChannelError(AMQPError):

# 分若干种情况
# 1. 连接断开，并一直没有恢复
# 能正常收到异常
# 2. 连接断开，并重连
#  能正常收到异常
# 3. 半开链接，连接和客户端处于ESTABLISHED状态，但是服务端已经关闭
# 这种pika库不会报错

def callback(ch, method, properties, body):

    # 先发送
    print(" [x] Publish Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties))
    time.sleep(30)

    try:
        channel.basic_publish(exchange=exchange, routing_key=queue_name,
                              body="Hello World!----------------", properties=properties)
    except Exception, e:
        import traceback
        print(traceback.format_exc())
        print('basic_publish %s' % e)
        return -1;


    print(" [x] Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties))

    try:
        time.sleep(60)
        ch.basic_ack(delivery_tag=method.delivery_tag)
    except ChannelClosed, inst:
        print('Error: ChannelClosed:  %s' % (inst,))
        return -1;
    except AMQPChannelError, inst:
        print('Error: AMQPChannelError:  %s' % (inst,))
        return -1;
    except AMQPError, inst:
        print('Error: AMQPError:  %s' % (inst,))
        return -1;
    except Exception, e:
        import traceback
        print(traceback.format_exc())
        print('create mq except %s' % e)
        return -1;
    print("continue callback finish.....")




channel.basic_consume(callback,
                      queue_name,
                      no_ack=False)

channel.start_consuming()
