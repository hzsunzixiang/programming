#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'TEST'
host_name ='localhost'
port=5672

credentials = pika.PlainCredentials(user, password)

# 创建连接
connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host=host_name,
			               port=port,
                           virtual_host=vhost,
						   credentials=credentials))

# 创建信道
channel = connection.channel()

# 创建 exchange 
channel.exchange_declare(exchange=exchange, exchange_type='direct')


# 创建队列
result = channel.queue_declare(queue=queue_name, durable=True)  

queue_name = result.method.queue
print 'queue_name:' + queue_name


# bind队列
# 只有声明了这句 才能真正的往队列发送消息 只需绑定一次
channel.queue_bind(exchange=exchange, queue=queue_name)

channel.queue_unbind(exchange=exchange, queue=queue_name)


channel.close()
connection.close()


#queue_unbind(queue, exchange=None, routing_key=None, arguments=None, callback=None)[source]
#Unbind a queue from an exchange.

#Parameters:	
#queue (str) – The queue to unbind from the exchange
#exchange (str) – The source exchange to bind from
#routing_key (str) – The routing key to unbind
#arguments (dict) – Custom key/value pair arguments for the binding
#callback (callable) – callback(pika.frame.Method) for method Queue.UnbindOk
#Raises:	
#ValueError –



