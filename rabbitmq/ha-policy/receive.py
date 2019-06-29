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

result = channel.queue_declare("hello3")

queue_name = result.method.queue
print 'queue_name:' + queue_name


# 指定exchange
#channel.exchange_declare(exchange='vstation1', exchange_type='direct')


channel.exchange_declare(exchange='logs_direct8', exchange_type='direct')


# 这一句很重要，否则不生效 
channel.queue_bind(exchange='logs_direct8', queue=queue_name)


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)

print 'begin to consume'
#time.sleep(15)
channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=True)

channel.start_consuming()



