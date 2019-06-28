#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

# sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete queue name=hello
exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'FLOW'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()

# 默认值 直接删除
channel.exchange_delete(exchange=exchange, if_unused=False)


# 故意不调用
#channel.close()
connection.close()

#exchange_delete(exchange=None, if_unused=False, callback=None)[source]
#Delete the exchange.
#
#Parameters:	
#exchange (str) – The exchange name
#if_unused (bool) – only delete if the exchange is unused
#callback (callable) – callback(pika.frame.Method) for method Exchange.DeleteOk
#Raises:	
#ValueError –
