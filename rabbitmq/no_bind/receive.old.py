#!/usr/bin/env python
# -*- coding:UTF-8

import pika

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'ericksun_test'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()

result = channel.queue_declare(queue=queue_name, durable=True)  

queue_name = result.method.queue
print 'queue_name:' + queue_name

# 指定exchange
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

# 这一句很重要，否则不生效 
channel.queue_bind(exchange=exchange, queue=queue_name)


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties)
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_consume(callback,
		              queue_name,
                      no_ack=False)

#channel.basic_consume(queue_name,
#	       	          callback,
#                      auto_ack=True)
channel.start_consuming()



#ericksun@debian-3:~/programming/rabbitmq/ack$ python receive.py
#queue_name:FLOW
# [*] Waiting for messages. To exit press CTRL+C
#  [x] Received 'Hello World!', ch:<BlockingChannel impl=<Channel number=1 OPEN conn=<SelectConnection OPEN transport=<pika.adapters.utils.io_services_utils._AsyncPlaintextTransport object at 0x7f09f3d02c10> params=<ConnectionParameters host=localhost port=5672 virtual_host=vstation ssl=False>>>> method:<Basic.Deliver(['consumer_tag=ctag1.66bad7623e634b8883a62fb512fd048e', 'delivery_tag=1', 'exchange=vstation', 'redelivered=False', 'routing_key=FLOW'])>, properties:<BasicProperties(['delivery_mode=2'])>
#
