#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

# connection_attempts  and retry_delay 
credentials = pika.PlainCredentials('ericksun', 'ericksun')

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host="/vstation",
                           connection_attempts=2,
                           retry_delay=6,
						   credentials=credentials))

channel = connection.channel()

channel.queue_declare(queue='hello')  

channel.exchange_declare(exchange='logs_direct', exchange_type='direct')

channel.basic_publish(exchange='logs_direct',
                      routing_key='hello',
                      body='Hello World!')
print " [x] Sent 'Hello World!'"
connection.close()  

# https://pika.readthedocs.io/en/stable/modules/parameters.html
# 这个是连接的总次数 而非重试次数
#connection_attempts
#Returns:	number of socket connection attempts. Defaults to DEFAULT_CONNECTION_ATTEMPTS. See also retry_delay.
#Return type:	int

#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
