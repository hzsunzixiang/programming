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

result = channel.queue_declare("hello")

queue_name = result.method.queue
print 'queue_name:' + queue_name


# 指定exchange
#channel.exchange_declare(exchange='vstation1', exchange_type='direct')


channel.exchange_declare(exchange='logs_direct', exchange_type='direct')


# 这一句很重要，否则不生效 
# routing_key 此时可有可无？ 不再有具体效果?
#  [x] method<Basic.Deliver(['consumer_tag=ctag1.4e87dae9ca084cee816fdcf8101d40d9', 'delivery_tag=1', 'exchange=logs_direct', 'redelivered=False', 'routing_key=xxx'])>
channel.queue_bind(exchange='logs_direct', queue=queue_name, routing_key="xixxxxxxxxxxxxxxxxxxxx")


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)
    print " [x] method%s" % (method,)
    print " [x] ch%s" % (ch,)
    print " [x] properties%s" % (properties,)

print 'begin to consume'
#time.sleep(15)
channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=True)

channel.start_consuming()



