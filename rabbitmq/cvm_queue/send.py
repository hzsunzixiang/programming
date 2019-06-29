#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time


credentials = pika.PlainCredentials('vstation', 'vstation')

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='10.10.86.91',
			               port=5672,
                           virtual_host="vstation",
						   credentials=credentials))

channel = connection.channel()
#result = channel.queue_declare(queue='FLOW')  
#result = channel.queue_declare(queue='TEST1', durable=True)  
result = channel.queue_declare(queue='FLOW', durable=True)  

queue_name = result.method.queue
print 'queue_name:' + queue_name

exchange_name = 'vstation'
channel.exchange_declare(exchange_name, exchange_type='direct', durable=True )

properties = pika.BasicProperties(delivery_mode=2,
                                  expiration='100000')
channel.basic_publish(exchange=exchange_name, routing_key=queue_name,
                           body="Hello World!", properties=properties)

#channel.basic_publish(exchange_name,
#                      routing_key=queue_name,
#                      body='Hello World!')
print " [x] Sent 'Hello World!'"
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
