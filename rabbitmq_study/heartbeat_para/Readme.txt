

# 服务端向客户端发送 Tune 包
    Method: Tune (30)

# 客户端回包 
    Method: Tune-Ok (31)    --- 

取双方最小值
抓包 或者 命令rabbitmqctl  list_connections timeout
5672_server_30s.pcap   服务端 80  客户端 30 , 最终协商为 30 : min(80/2, 30) = 30
5672_server.pcap       服务端 80  客户端 60 , 最终协商为 40 : min(80/2, 60) = 40
5672_server_0s.pcap    服务端 80  客户端 0 ,  最终协商为 0  也就是不发送心跳

5672_10000000.pcap     服务端 10000000  客户端没设置 , 协商出的是一个最大值 38528



# https://www.rabbitmq.com/heartbeats.html
How to Disable Heartbeats
Heartbeats can be disabled by setting the timeout interval to 0 on the client side at connection time.



# https://www.rabbitmq.com/amqp-0-9-1-reference.html#connection.tune-ok

short heartbeat

The delay, in seconds, of the connection heartbeat that the client wants. Zero means the client does not want a heartbeat.




# rabbitmqctl  list_connections timeout

没有心跳
ericksun@192.168.56.101:~/programming/rabbitmq_study/heartbeat_para (master)$ sudo rabbitmqctl  list_connections timeout
Listing connections ...
0

60s
ericksun@192.168.56.101:~/programming/rabbitmq_study/heartbeat_para (master)$ sudo rabbitmqctl  list_connections timeout
Listing connections ...
60


ericksun@192.168.56.101:~/programming/rabbitmq_study/heartbeat_para (master)$ sudo rabbitmqctl  list_connections timeout
Listing connections ...
30

# 设为一个很大的值 1000000
ericksun@192.168.56.101:~/programming/rabbitmq_study/heartbeat_para (master)$ sudo rabbitmqctl  list_connections timeout
Listing connections ...
38528

虽然这里显示的是 1000000  但是实际的效果是 38528
ericksun@192.168.56.101:~/programming/rabbitmq_study/heartbeat_para (master)$ sudo rabbitmqctl  environment |grep heart
      {heartbeat,10000000},




