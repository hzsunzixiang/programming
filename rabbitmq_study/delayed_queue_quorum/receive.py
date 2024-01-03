#!/usr/bin/env python
# -*- coding:UTF-8

import pika

delay_exchange = 'vstation_delay_exchange'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'FLOW_DELAYED_QUORUM'

host_name = 'localhost'
credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host=host_name,
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()

result = channel.queue_declare(queue=queue_name, durable=True, arguments={"x-queue-type": "quorum"})  

queue_name = result.method.queue
print('queue_name:' + queue_name)

# 指定exchange
channel.exchange_declare(exchange=delay_exchange, exchange_type='x-delayed-message', arguments={"x-delayed-type": "direct"}, durable=True)

# 这一句很重要，否则不生效 
channel.queue_bind(exchange=delay_exchange, queue=queue_name)


print(' [*] Waiting for messages. To exit press CTRL+C')

def callback(ch, method, properties, body):
    #print " [x] Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties)
    print(" [x] Received %r" % (body, ))
    print(" [x] properties%r" % (str(properties), ))
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=False)

channel.start_consuming()

