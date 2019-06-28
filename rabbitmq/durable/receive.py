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

result = channel.queue_declare("hello2", durable=True)
#result = channel.queue_declare("hello")

queue_name = result.method.queue
print 'queue_name:' + queue_name



exchange_name="logs_direct6"
# 指定exchange

channel.exchange_declare(exchange=exchange_name, exchange_type='direct', durable=True)
#channel.exchange_declare(exchange=exchange_name, exchange_type='direct', durable=False)
#channel.exchange_declare(exchange=exchange_name, exchange_type='direct')


# 这一句很重要，否则不生效 
channel.queue_bind(exchange=exchange_name, queue=queue_name)


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)

print 'begin to consume'
channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=True)

channel.start_consuming()



