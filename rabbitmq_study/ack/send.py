#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time
import sys 
from datetime import datetime

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
#queue_name =  'TEST_ACK'
queue_name =  'FLOW_TEST_BY_ERICKSUN'

host_name = 'localhost'
credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host=host_name,
                           virtual_host=vhost,
						   credentials=credentials))

#time.sleep(10000000)
channel = connection.channel()
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

#for x in range(30):
#    time.sleep(1)
#    sys.stdout.write('.' + str(x))
#    sys.stdout.flush()

# datetime object containing current date and time
now = datetime.now()
print("now =", now)
# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print("date and time =", dt_string)

result = channel.queue_declare(queue=queue_name, durable=True)  

queue_name = result.method.queue
print('queue_name:' + queue_name)

#time.sleep(10000000)


# 这一句很重要，否则不生效 
channel.queue_bind(exchange=exchange, queue=queue_name)

# 加上这个属性才能做到真正的持久化
#properties = pika.BasicProperties(delivery_mode=2,
#                                  expiration='10000000')


properties = pika.BasicProperties(delivery_mode=2)
channel.basic_publish(exchange=exchange, routing_key=queue_name,
                           body="Hello World!", properties=properties)

#time.sleep(1000)

channel.basic_publish(exchange=exchange, routing_key=queue_name,
                           body="Hello World!", properties=properties)

print(" [x] Sent 'Hello World!'")
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
