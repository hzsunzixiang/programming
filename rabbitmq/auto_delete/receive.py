#!/usr/bin/env python
# -*- coding:UTF-8

import pika

exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
#queue_name =  'FLOW'
queue_name =  'auto_delete_test'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='localhost',
                           virtual_host=vhost,
						   credentials=credentials))

channel = connection.channel()


# 消费消息之后 队列自动删除， 加入队列的消息个数不显示？
result = channel.queue_declare(queue=queue_name, auto_delete=True, durable=True)  

queue_name = result.method.queue
print 'queue_name:' + queue_name

# 指定exchange
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

# 这一句很重要，否则不生效 
channel.queue_bind(exchange=exchange, queue=queue_name)


print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch, method, properties, body):
    #print " [x] Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties)
    print " [x] Received %r" % (body, )
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_consume(queue_name,
	       	          callback,
                      auto_ack=False)

#channel.basic_consume(queue_name,
#	       	          callback,
#                      auto_ack=True)
channel.start_consuming()


# 如果开两个窗口同时接受 则会报错， queue_declare 没有参数 exclusive 则可以同时接受

#ericksun@debian-3:~/programming/rabbitmq/exclusive$ ./receive.py
#Traceback (most recent call last):
#  File "./receive.py", line 22, in <module>
#    result = channel.queue_declare(queue=queue_name, exclusive=True, durable=True)
#  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 2498, in queue_declare
#    self._flush_output(declare_ok_result.is_ready)
#  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 1331, in _flush_output
#    raise self._closing_reason  # pylint: disable=E0702
#pika.exceptions.ChannelClosedByBroker: (405, "RESOURCE_LOCKED - cannot obtain exclusive access to locked queue 'exclusive_test1' in vhost 'vstation'")

