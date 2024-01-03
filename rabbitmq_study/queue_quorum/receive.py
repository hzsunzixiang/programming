#!/usr/bin/env python
# -*- coding:UTF-8

import pika

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'FLOW_QUORUM'

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
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)


# 这一句很重要，否则不生效 
channel.queue_bind(exchange=exchange, queue=queue_name)


print(' [*] Waiting for messages. To exit press CTRL+C')

def callback(ch, method, properties, body):
    #print " [x] Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties)
    print(" [x] Received %r" % (body, ))
    ch.basic_ack(delivery_tag = method.delivery_tag)
    #ch.basic_ack(delivery_tag = method.delivery_tag, multiple=True)
    #ch.basic_ack(delivery_tag = 0, multiple=True)
    #pika.exceptions.ChannelClosedByBroker: (406, 'PRECONDITION_FAILED - unknown delivery tag 1')
    #ch.basic_ack(delivery_tag = 2, multiple=True)

channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=False)

channel.start_consuming()


#basic_ack(delivery_tag=0, multiple=False)[source]
#Acknowledge one or more messages. When sent by the client, this method acknowledges one or more messages delivered via the Deliver or Get-Ok methods. When sent by server, this method acknowledges one or more messages published with the Publish method on a channel in confirm mode. The acknowledgement can be for a single message or a set of messages up to and including a specific message.
#
#Parameters:	
#delivery_tag (integer) – int/long The server-assigned delivery tag
#multiple (bool) – If set to True, the delivery tag is treated as “up to and including”, so that multiple messages can be acknowledged with a single method. If set to False, the delivery tag refers to a single message. If the multiple field is 1, and the delivery tag is zero, this indicates acknowledgement of all outstanding messages.
