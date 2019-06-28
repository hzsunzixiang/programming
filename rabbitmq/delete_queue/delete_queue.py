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

#channel.queue_delete(queue=queue_name)
# 正在被使用
#channel.queue_delete(queue=queue_name, if_unused=True, if_empty=False)

# 没在被使用，但非空
#channel.queue_delete(queue=queue_name, if_unused=False, if_empty=True)

# 默认值 直接删除
channel.queue_delete(queue=queue_name, if_unused=False, if_empty=False)

connection.close()

#queue_delete(queue, if_unused=False, if_empty=False, callback=None)[source]

#Delete a queue from the broker.
#
#Parameters:	
#queue (str) – The queue to delete
#if_unused (bool) – only delete if it’s unused
#if_empty (bool) – only delete if the queue is empty
#callback (callable) – callback(pika.frame.Method) for method Queue.DeleteOk
#Raises:	
#ValueError –
