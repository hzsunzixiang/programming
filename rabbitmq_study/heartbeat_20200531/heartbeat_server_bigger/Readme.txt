


1. 服务端的heartbeat为超时时间
   heartbeat interval = heatbeat timeout / 2


服务端 80(heartbeat) 客户端heartbeat 30(间隔时间) , 最终协商为 40(间隔时间) : min(80/2, 60) = 40 




服务端 80 (heartbeat_timeout)  客户端 60 (heartbeat interval), 也就是heartbeat_timeout=120 , 最终协商为 40 : min(80/2, 60) = 40

服务端 80 (heartbeat_timeout)  客户端 60 (heartbeat_timeout), , 最终协商为 60 


##1. 服务端

root@debian9-4:/home/ericksun/rabbitmqctl# rabbitmqctl environment |grep heartbeat
      {heartbeat,80},

##2. 客户端
connection = pika.BlockingConnection(pika.ConnectionParameters(
                           host='192.168.142.137',
                           virtual_host=vhost,
                           heartbeat=60,
                           credentials=credentials))

