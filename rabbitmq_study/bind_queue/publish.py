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
result = channel.queue_declare(queue=queue_name)  

queue_name = result.method.queue
print 'queue_name:' + queue_name


channel.basic_publish(exchange=exchange,
                      routing_key=queue_name,
                      body='Hello World!')
print " [x] Sent 'Hello World!'"
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
