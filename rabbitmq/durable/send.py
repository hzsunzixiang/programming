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


# 持久化这里起作用 重启也有效果
#result = channel.queue_declare(queue='hello')  
result = channel.queue_declare("hello2", durable=True)

queue_name = result.method.queue
print 'queue_name:' + queue_name


exchange_name="logs_direct6"

channel.exchange_declare(exchange=exchange_name, exchange_type='direct', durable=True)
#channel.exchange_declare(exchange=exchange_name, exchange_type='direct', durable=False)
#channel.exchange_declare(exchange=exchange_name, exchange_type='direct')

#                     properties=pika.BasicProperties(delivery_mode=2,)
# 必须加上这句才能真正的持久化
# https://www.cnblogs.com/Keep-Ambition/p/8044752.html 
channel.basic_publish(exchange=exchange_name,
                      routing_key=queue_name,
                      body='Hello World!',
                      properties=pika.BasicProperties(delivery_mode=2,)
					  )
print " [x] Sent 'Hello World!'"
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
