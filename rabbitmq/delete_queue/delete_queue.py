#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

# sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete queue name=hello
exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'hello'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()

channel.queue_delete(queue=queue_name)

connection.close()
