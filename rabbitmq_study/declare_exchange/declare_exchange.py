#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'hello'
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
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

#删除 exchange
#
#sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete exchange name=vstation

channel.close()
connection.close()  


#sudo rabbitmqctl add_vhost /vstation
 
#sudo rabbitmqctl set_permissions -p /vstation ericksun ".*" ".*" ".*"
 
#sudo  rabbitmqctl list_vhosts

#sudo rabbitmqctl set_permissions -p / ericksun ".*" ".*" ".*"
