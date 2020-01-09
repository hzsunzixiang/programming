

# 服务端向客户端发送 Tune 包
    Method: Tune (30)

# 客户端回包 
    Method: Tune-Ok (31)    --- 

取双方最小值
5672_server_30s.pcap   服务端 80  客户端 30 , 最终协商为 30 : min(80/2, 30) = 30
5672_server.pcap       服务端 80  客户端 60 , 最终协商为 40 : min(80/2, 60) = 40
5672_server_0s.pcap    服务端 80  客户端 0 ,  最终协商为 0  也就是不发送心跳



# https://www.rabbitmq.com/heartbeats.html
How to Disable Heartbeats
Heartbeats can be disabled by setting the timeout interval to 0 on the client side at connection time.



# https://www.rabbitmq.com/amqp-0-9-1-reference.html#connection.tune-ok

short heartbeat

The delay, in seconds, of the connection heartbeat that the client wants. Zero means the client does not want a heartbeat.
