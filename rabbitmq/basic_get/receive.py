#!/usr/bin/env python
# -*- coding:UTF-8

import pika

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'FLOW'

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

#channel.basic_get(queue_name, callback)
msg = channel.basic_get(queue_name)
print msg
#channel.basic_ack(delivery_tag = msg.delivery_tag)

#https://student-lp.iteye.com/blog/2106482



#basic_get(queue, callback, auto_ack=False)[source]
#Get a single message from the AMQP broker. If you want to be notified of Basic.GetEmpty, use the Channel.add_callback method adding your Basic.GetEmpty callback which should expect only one parameter, frame. Due to implementation details, this cannot be called a second time until the callback is executed. For more information on basic_get and its parameters, see:
#
#http://www.rabbitmq.com/amqp-0-9-1-reference.html#basic.get
#
#Parameters:	
#queue (str) – The queue from which to get a message. Use the empty string to specify the most recent server-named queue for this channel
#callback (callable) – The callback to call with a message that has the signature callback(channel, method, properties, body), where: channel: pika.Channel method: pika.spec.Basic.GetOk properties: pika.spec.BasicProperties body: bytes
#auto_ack (bool) – Tell the broker to not expect a reply
#Raises:	
#ValueError –
