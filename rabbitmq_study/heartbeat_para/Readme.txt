

# 服务端向客户端发送 Tune 包
    Method: Tune (30)

# 客户端回包 
    Method: Tune-Ok (31)    --- 

取双方最小值
5672_server_30s.pcap   服务端 80  客户端 30 , 最终协商为 30 : min(80/2, 30) = 30
5672_server.pcap       服务端 80  客户端 60 , 最终协商为 40 : min(80/2, 60) = 40
5672_server_0s.pcap    服务端 80  客户端 0 ,  最终协商为 0  也就是不发送心跳

