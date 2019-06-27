#!/usr/bin/env python
# -*- coding:UTF-8

import pika

credentials = pika.PlainCredentials('ericksun', 'ericksun')

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host="/vstation",
						   credentials=credentials))
channel = connection.channel()

channel.queue_declare(queue='hello')

# 指定exchange
channel.exchange_declare(exchange='vstation1', exchange_type='direct')

print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)

#channel.basic_consume(callback,
#                      queue='hello',
#                      no_ack=True)

channel.basic_consume('hello',
	       	          callback,
                      auto_ack=True)

channel.start_consuming()



