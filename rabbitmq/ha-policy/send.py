#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'FLOW'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()

result = channel.queue_declare(queue=queue_name, durable=True)  
#  rabbitmq镜像队列的设置问题。书上提到的是在queue_declare里的arguments参数中添加"x-ha-policy":"all"键值对。但是我网上查了下，目前3.0版本以上后,就不支持这种方式了。需要在rabbitmq中添加policy.这个可以开启rabbitmq的webmanage插件，然后在web页面里面方便的做配置.
# https://niubidian.top/blog/show/56/
# 这个参数设置应该是没有用了
result = channel.queue_declare(queue=queue_name, durable=True,  
                               arguments={'x-ha-policy': 'all'})

queue_name = result.method.queue
print 'queue_name:' + queue_name

channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

channel.basic_publish(exchange=exchange,
                      routing_key=queue_name,
                      body='Hello World!')
print " [x] Sent 'Hello World!'"
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
