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

result = channel.queue_declare(queue='hello')  

queue_name = result.method.queue
print 'queue_name:' + queue_name

channel.exchange_declare(exchange='logs_direct', exchange_type='direct')

channel.queue_bind(exchange='logs_direct', queue=queue_name, routing_key="xxx")

# queue_bind这里的routing_key 必须和 basic_publish 这里的一致
#  不然错误很微妙

channel.basic_publish(exchange='logs_direct',
                      #routing_key=queue_name,
                      routing_key="xxx",
                      body='Hello World!')
print " [x] Sent 'Hello World!'"
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
