#!/usr/bin/env python
# -*- coding:UTF-8

import thread
import pika
import time

def connect_rabbitmq():
    print "in connect_rabbitmq ......"
    exchange = 'vstation'
    vhost = 'vstation'
    user =  'vstation'
    password = 'vstation'
    queue_name =  'FLOW'
    
    credentials = pika.PlainCredentials(user, password)
    
    connection = pika.BlockingConnection(pika.ConnectionParameters(
    			               host='9.134.165.238',
                               virtual_host=vhost,
    						   credentials=credentials))
    
    channel = connection.channel()
    
    result = channel.queue_declare(queue=queue_name, durable=True)  
    
    queue_name = result.method.queue
    print 'queue_name:' + queue_name
    
    channel.exchange_declare(exchange=exchange, exchange_type='direct', durable=True)
    
    # 这一句很重要，否则不生效 
    channel.queue_bind(exchange=exchange, queue=queue_name)
    
    # 加上这个属性才能做到真正的持久化
    #properties = pika.BasicProperties(delivery_mode=2,
    #                                  expiration='10000000')
    properties = pika.BasicProperties(delivery_mode=2)
    channel.basic_publish(exchange=exchange, routing_key=queue_name,
                               body="Hello World!", properties=properties)
    
    #time.sleep(1000)
    
    print " [x] Sent 'Hello World!'"
    #time.sleep(10000000000)
    #connection.close()  
    return connection

# 创建两个线程
try:
   array_list = []
   for num in range(0,2000):  
       connection =  connect_rabbitmq()
       array_list.append(connection)
       time.sleep(0.1) 
except:
   print "Error: unable to start thread"
 

#time.sleep(99999)
