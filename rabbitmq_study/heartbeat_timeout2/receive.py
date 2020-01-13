#!/usr/bin/env python
# -*- coding:UTF-8

import pika
import time
from pika.exceptions import AMQPError, AMQPConnectionError, AMQPHeartbeatTimeout


exchange = 'vstation'
vhost = 'vstation'
user =  'vstation'
password = 'vstation'
queue_name =  'FLOW'

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
			               host='192.168.56.101',
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
    time.sleep(240)
    try:
        ch.basic_ack(delivery_tag = method.delivery_tag)
    except Exception, e:
        import traceback
        print(traceback.format_exc())
        print('create mq except... %s' % e)

try:
    channel.basic_consume(queue_name,
    	       	          callback,
                      auto_ack=False)
    channel.start_consuming()
except AMQPHeartbeatTimeout, inst:
    print('Error: AMQPHeartbeatTimeout: %s' % (inst))
except AMQPConnectionError, inst:
    print('Error: AMQPConnectionError: %s' % (inst))
except AMQPError, inst:
    print('Error: ConnectionError AMQPError : %s' % (inst))
except Exception, e:
    import traceback
    print(traceback.format_exc())
    print('create mq except %s' % e)


#ericksun@192.168.56.103:~/programming/rabbitmq_study/heartbeat_timeout2 (master)$ ./receive.py
#queue_name:FLOW
# [*] Waiting for messages. To exit press CTRL+C
# [x] Received 'Hello World!', ch:<BlockingChannel impl=<Channel number=1 OPEN conn=<SelectConnection OPEN transport=<pika.adapters.utils.io_services_utils._AsyncPlaintextTransport object at 0x7fda83b389d0> params=<ConnectionParameters host=192.168.56.101 port=5672 virtual_host=vstation ssl=False>>>> method:<Basic.Deliver(['consumer_tag=ctag1.79638d5b08ae455eb4f44cd49a00ea2c', 'delivery_tag=1', 'exchange=vstation', 'redelivered=True', 'routing_key=FLOW'])>, properties:<BasicProperties(['delivery_mode=2'])>
#Traceback (most recent call last):
#  File "./receive.py", line 44, in callback
#    ch.basic_ack(delivery_tag = method.delivery_tag)
#  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 2113, in basic_ack
#    self._flush_output()
#  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 1336, in _flush_output
#    self._connection._flush_output(lambda: self.is_closed, *waiters)
#  File "/usr/local/lib/python2.7/dist-packages/pika/adapters/blocking_connection.py", line 522, in _flush_output
#    raise self._closed_result.value.error
#StreamLostError: Stream connection lost: error(104, 'Connection reset by peer')
#
#create mq except... Stream connection lost: error(104, 'Connection reset by peer')
# [x] Received 'Hello World!', ch:<BlockingChannel impl=<Channel number=1 CLOSED conn=<SelectConnection CLOSED transport=None params=<ConnectionParameters host=192.168.56.101 port=5672 virtual_host=vstation ssl=False>>>> method:<Basic.Deliver(['consumer_tag=ctag1.79638d5b08ae455eb4f44cd49a00ea2c', 'delivery_tag=2', 'exchange=vstation', 'redelivered=True', 'routing_key=FLOW'])>, properties:<BasicProperties(['delivery_mode=2'])>

