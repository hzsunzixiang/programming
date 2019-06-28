#!/usr/bin/env python
# -*- coding:UTF-8

import pika

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name = 'hello3'
host_name ='localhost'
port=5672

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host=host_name,
			               port=port,
                           virtual_host=vhost,
						   credentials=credentials))


channel = connection.channel()

result = channel.queue_declare(queue=queue_name)  

queue_name = result.method.queue
print 'queue_name:' + queue_name

# 指定exchange
channel.exchange_declare(exchange=exchange, exchange_type='direct')

# 这一句很重要，否则不生效 
#channel.queue_bind(exchange=exchange, queue=queue_name)


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r" % (body,)

channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=True)

channel.start_consuming()



