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

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host=host_name,
			               port=port,
                           virtual_host=vhost,
						   credentials=credentials))
channels=[]
for i in range(3):
    channel = connection.channel()
    channels.append(channel)
    time.sleep(1)
for i in channels:
    i.close()
    time.sleep(1)
connection.close()



time.sleep(1)
