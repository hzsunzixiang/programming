



# 两个注意的地方


## 需要自动ACK
        self.channel.basic_consume(queue, callback, auto_ack=True)
如果改为 auto_ack = FALSE ， 发现消息一直不消费  通过图形界面可以看到
        self.channel.basic_consume(queue, callback, auto_ack=True)


## pika的版本不对，对参数顺序有影响 
        #self.channel.basic_consume(callback, queue=queue, no_ack=no_ack)
        # 特别注意这里的熟顺序，跟 pika版本有关系
        # auto_ack = True 很关键，不然一直不消费
        self.channel.basic_consume(queue, callback, auto_ack=True)
