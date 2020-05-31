

# 这里有个现象
加 expiration 参数，会导致 send 不成功


properties = pika.BasicProperties(delivery_mode=2,
                                  expiration='60')

如果 去除这个参数发送一次，再次加上 expiration 参数，发送就能成功

#properties = pika.BasicProperties(delivery_mode=2)

现象如下
# 先加 expiration
with_expiration_1.pcap

ericksun@debian9-4:~/programming/rabbitmq_study/heartbeat_para$ sudo rabbitmqctl  list_queues  -p vstation name  messages_ready messages_unacknowledged |grep EIRICKSUN_EXPIRATION
EIRICKSUN_EXPIRATION    0       0


# 不加 expiration
without_expiration_2.pcap

sun@debian9-4:~/programming/rabbitmq_study/heartbeat_para$ sudo rabbitmqctl  list_queues  -p vstation name  messages_ready messages_unacknowledged |grep EIRICKSUN_EXPIRATION
EIRICKSUN_EXPIRATION    1       0



# 再加 expiration
without_expiration_3.pcap

ericksun@debian9-4:~/programming/rabbitmq_study/heartbeat_para$ sudo rabbitmqctl  list_queues  -p vstation name  messages_ready messages_unacknowledged |grep EIRICKSUN_EXPIRATION
EIRICKSUN_EXPIRATION    2       0


