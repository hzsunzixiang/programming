#!/usr/bin/env python
# -*- coding:UTF-8

import pika

# from test.logger import LOGGER


exchange = 'vstation'
vhost = 'vstation'
user = 'vstation'
password = 'vstation'
queue_name = 'FLOW'
host = '192.168.247.145'
heartbeat = 40

# LOGGER.debug('debug message in main..................... ')


credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
    host=host,
    virtual_host=vhost,
    heartbeat=heartbeat,
    credentials=credentials))

channel = connection.channel()

result = channel.queue_declare(queue=queue_name, durable=True)

queue_name = result.method.queue
print('queue_name:' + queue_name)

channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

# 这一句很重要，否则不生效
channel.queue_bind(exchange=exchange, queue=queue_name)


# def callback_block(connection, method):
#    print("blocked [x] connection:%s method:%s" % (connection, method))
# def callback_block(*args, **keywords):
#     # LOGGER.debug('debug message in callback_block..................... args:%s',args)
#     print('debug message in callback_block..................... args:%s, keyworkds:%s',args,keywords)
# def callback_block(connection, connection2, method):
#     # LOGGER.debug('debug message in callback_block..................... args:%s',args)
#     print('debug message in callback_block..................... connection:%s,\n connection2:%s, \n method:%s'%(connection, connection2, method))
#

def callback_block(connection, method):
    # LOGGER.debug('debug message in callback_block..................... args:%s',args)
    print('debug message in callback_block..................... connection:%s,\n , \n method:%s' % (connection, method))


def callback_unblock(connection, method):
    print("unblocked [x] connection:%s method:%s" % (connection, method))


# LOGGER.debug('debug message in add ..... callback_block..................... ')
connection.add_on_connection_blocked_callback(callback_block)
connection.add_on_connection_unblocked_callback(callback_unblock)
# 加上这个属性才能做到真正的持久化
properties = pika.BasicProperties(delivery_mode=2)

channel.basic_publish(exchange=exchange, routing_key=queue_name,
                      body="Hello World!", properties=properties)
print(" [x] Sent 'Hello World!'")
# connection.sleep(0.01)
connection.process_data_events(0.1)
print(" [x] sleep ok'")
connection.close()

# process_data_events(time_limit=0)[source]
# Will make sure that data events are processed. Dispatches timer and channel callbacks if not called from the scope of BlockingConnection or BlockingChannel callback. Your app can block on this method.
#
# Parameters:	time_limit (float) – suggested upper bound on processing time in seconds. The actual blocking time depends on the granularity of the underlying ioloop. Zero means return as soon as possible. None means there is no limit on processing time and the function will block until I/O produces actionable events. Defaults to 0 for backward compatibility. This parameter is NEW in pika 0.10.0.
