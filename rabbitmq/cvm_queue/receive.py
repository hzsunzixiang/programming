#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time

credentials = pika.PlainCredentials('vstation', 'vstation')

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='10.10.86.91',
			               port=5672,
                           virtual_host="vstation",
						   credentials=credentials))

channel = connection.channel()

#result = channel.queue_declare("TEST1", durable=True)
result = channel.queue_declare("FLOW", durable=True)

queue_name = result.method.queue
print 'queue_name:' + queue_name


# 指定exchange
#channel.exchange_declare(exchange='vstation1', exchange_type='direct')


exchange_name = 'vstation'
channel.exchange_declare(exchange_name, exchange_type='direct', durable=True )


# 这一句很重要，否则不生效 
#channel.queue_bind(exchange_name, queue=queue_name)


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)

print 'begin to consume'
#time.sleep(15)
channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=True)
#channel.basic_consume(callback, queue='hello', no_ack=True)
#channel.basic_consume(callback,
#		              queue_name,
#                      no_ack=True)

channel.start_consuming()



