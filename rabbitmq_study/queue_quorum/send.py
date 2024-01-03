#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time
import sys 
from datetime import datetime

exchange = 'vstation_exchange'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
#queue_name =  'TEST_ACK'
queue_name =  'FLOW_QUORUM'


host_name = 'localhost'
credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host=host_name,
                           virtual_host=vhost,
						   credentials=credentials))

#time.sleep(10000000)
channel = connection.channel()
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

result = channel.queue_declare(queue=queue_name, durable=True, arguments={"x-queue-type": "quorum"})  
queue_name = result.method.queue
print('queue_name:' + queue_name)

# 这一句很重要，否则不生效 
channel.queue_bind(exchange=exchange, queue=queue_name)

#classpika.spec.BasicProperties(content_type=None, content_encoding=None, headers=None, delivery_mode=None, priority=None, correlation_id=None, reply_to=None, expiration=None, message_id=None, timestamp=None, type=None, user_id=None, app_id=None, cluster_id=None)[source]

# 加上这个属性才能做到真正的持久化
properties = pika.BasicProperties(delivery_mode=2)

print("properties:" + str(properties))


dt_string = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
print("date and time =", dt_string)

for num in range(0, 10000):
    channel.basic_publish(exchange=exchange, routing_key=queue_name,
                               body="Hello World!"+dt_string, properties=properties)

print(" [x] Sent 'Hello World!'")
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
