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
#channel.exchange_declare(exchange='vstation1', exchange_type='direct')
channel.exchange_declare(exchange='logs_direct', exchange_type='direct')


# 这一句很重要，否则不生效 
channel.queue_bind(exchange='logs_direct', queue='hello')


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)

channel.basic_consume('hello',
	       	          callback,
                      auto_ack=True)

channel.start_consuming()



