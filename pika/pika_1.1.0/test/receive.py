#!/usr/bin/env python
# -*- coding:UTF-8

import pika

from test.logger import LOGGER

# https://www.rabbitmq.com/amqp-0-9-1-reference.html#connection.tune-ok
# https://pika.readthedocs.io/en/stable/modules/parameters.html
# class pika.connection.ConnectionParameters(host=<class 'pika.connection._DEFAULT'>, port=<class 'pika.connection._DEFAULT'>, virtual_host=<class 'pika.connection._DEFAULT'>, credentials=<class 'pika.connection._DEFAULT'>, channel_max=<class 'pika.connection._DEFAULT'>, frame_max=<class 'pika.connection._DEFAULT'>, heartbeat=<class 'pika.connection._DEFAULT'>, ssl_options=<class 'pika.connection._DEFAULT'>, connection_attempts=<class 'pika.connection._DEFAULT'>, retry_delay=<class 'pika.connection._DEFAULT'>, socket_timeout=<class 'pika.connection._DEFAULT'>, stack_timeout=<class 'pika.connection._DEFAULT'>, locale=<class 'pika.connection._DEFAULT'>, blocked_connection_timeout=<class 'pika.connection._DEFAULT'>, client_properties=<class 'pika.connection._DEFAULT'>, tcp_options=<class 'pika.connection._DEFAULT'>, **kwargs)[source]


# heartbeat
# Returns:   AMQP connection heartbeat timeout value for negotiation during connection tuning or callable which is invoked during connection tuning. None to accept broker’s value. 0 turns heartbeat off. Defaults to DEFAULT_HEARTBEAT_TIMEOUT.
# Return type:   int|callable|None


# https://www.rabbitmq.com/heartbeats.html
# Note that in case RabbitMQ server has a non-zero heartbeat timeout configured (which is the default in versions starting with 3.6.x), the client can only lower the value but not increase it.
# 也就是客户端只能减小，不能提高这个heartbeat

exchange = 'vstation'
vhost = 'vstation'
user = 'vstation'
password = 'vstation'
queue_name = 'FLOW'
host = '192.168.56.101'
# heartbeat = 40

credentials = pika.PlainCredentials(user, password)

connection = pika.BlockingConnection(pika.ConnectionParameters(
    host=host,
    virtual_host=vhost,
    # heartbeat=heartbeat,
    credentials=credentials))

channel = connection.channel()
result = channel.queue_declare(queue=queue_name, durable=True)

queue_name = result.method.queue
print('queue_name:' + queue_name)

# 指定exchange
channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)

# 这一句很重要，否则不生效
channel.queue_bind(exchange=exchange, queue=queue_name)

print(' [*] Waiting for messages. To exit press CTRL+C')


def callback(ch, method, properties, body):
    print(" [x] Received %r, ch:%s method:%s, properties:%s" % (body, ch, method, properties))
    ch.basic_ack(delivery_tag=method.delivery_tag)


channel.basic_consume(queue_name,
                      callback,
                      auto_ack=False)

channel.start_consuming()
