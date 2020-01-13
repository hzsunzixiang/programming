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
    #time.sleep(240)
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


#class AMQPHeartbeatTimeout(AMQPConnectionError):
#	    """Connection was dropped as result of heartbeat timeout."""

# Error: AMQPHeartbeatTimeout: No activity or too many missed heartbeats in the last 60 seconds
#Error: AMQPConnectionError: No activity or too many missed heartbeats in the last 60 seconds





