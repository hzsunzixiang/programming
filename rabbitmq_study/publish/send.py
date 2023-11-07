#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'TEST_ERICKSUN5'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='192.168.142.137',
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()

result = channel.queue_declare(queue=queue_name, durable=True)  

queue_name = result.method.queue
print('queue_name:' + queue_name)

channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

# 这一句很重要，否则不生效 
channel.queue_bind(exchange=exchange, queue=queue_name)

# 加上这个属性才能做到真正的持久化
properties = pika.BasicProperties(delivery_mode=2, expiration='10000000')
channel.basic_publish(exchange=exchange, routing_key=queue_name,
                           body="Hello World!", properties=properties)

print(" [x] Sent 'Hello World!'")
channel.close()
connection.close()  

