

#接收到消息睡眠，模拟处理流程比较久的情形
    time.sleep(240)

# heartbeat超时之后 被服务端断开
   create mq except... Stream connection lost: error(104, 'Connection reset by peer')
