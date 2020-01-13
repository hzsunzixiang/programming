





# 客户端到服务端的心跳drop掉，看下服务端的反应
sudo iptables -A OUTPUT -s 192.168.56.103 -d 192.168.56.101  -p tcp --dport 5672 -j DROP


# 结果报错

  Error: AMQPHeartbeatTimeout: No activity or too many missed heartbeats in the last 60 seconds
  Error: AMQPConnectionError: No activity or too many missed heartbeats in the last 60 seconds


由于 AMQPHeartbeatTimeout 继承自 AMQPConnectionError 
所以要先捕获 AMQPHeartbeatTimeout 才看能到 AMQPHeartbeatTimeout 异常 
#https://pika.readthedocs.io/en/stable/_modules/pika/exceptions.html#AMQPHeartbeatTimeout
class AMQPHeartbeatTimeout(AMQPConnectionError):
    """Connection was dropped as result of heartbeat timeout."""


# 抓包
timeout_exception.pcap
timeout_exception2.pcap
