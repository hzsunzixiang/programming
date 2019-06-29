#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time


credentials = pika.PlainCredentials('ericksun', 'ericksun')

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host="/vstation",
						   credentials=credentials))

channel = connection.channel()

#  rabbitmq镜像队列的设置问题。书上提到的是在queue_declare里的arguments参数中添加"x-ha-policy":"all"键值对。但是我网上查了下，目前3.0版本以上后,就不支持这种方式了。需要在rabbitmq中添加policy.这个可以开启rabbitmq的webmanage插件，然后在web页面里面方便的做配置.
# https://niubidian.top/blog/show/56/
# 这个参数设置应该是没有用了
result = channel.queue_declare(queue='hello3',  
                               arguments={'x-ha-policy': 'all'})

queue_name = result.method.queue
print 'queue_name:' + queue_name

channel.exchange_declare(exchange='logs_direct8', exchange_type='direct')

channel.basic_publish(exchange='logs_direct8',
                      routing_key=queue_name,
                      body='Hello World!')
print " [x] Sent 'Hello World!'"
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
