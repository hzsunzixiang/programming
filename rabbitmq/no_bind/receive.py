#!/usr/bin/env python
# -*- coding:UTF-8

import pika

#exchange = 'vstation_delay_exchange'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'DELAYED_QUEUE_2'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()

result = channel.queue_declare(queue=queue_name, durable=True)  

queue_name = result.method.queue
print 'queue_name:' + queue_name

## 发送的时候 需要bind 一旦发送方bind之后， 接收方可以不再需要bind，
## 指定exchange
#channel.exchange_declare(exchange='vstation_delay_exchange',
#        exchange_type='x-delayed-message',
#        arguments={"x-delayed-type":"direct"},
#        durable=True)


## 这一句很重要，否则不生效 
#channel.queue_bind(exchange=exchange, queue=queue_name)


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    print " [x] Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties)
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=False)

channel.start_consuming()

