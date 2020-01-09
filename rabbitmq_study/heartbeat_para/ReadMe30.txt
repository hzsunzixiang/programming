


# 服务端向客户端发送 
  服务端设置的 80s 是超时时间 , 间隔时间为 Heartbeat / 2 
Frame 9: 88 bytes on wire (704 bits), 88 bytes captured (704 bits)
Linux cooked capture
Internet Protocol Version 4, Src: 192.168.56.101, Dst: 192.168.56.103
Transmission Control Protocol, Src Port: 5672, Dst Port: 35664, Seq: 488, Ack: 313, Len: 20
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 12
    Class: Connection (10)
    Method: Tune (30)
    Arguments
        Channel-Max: 0
        Frame-Max: 131072
        Heartbeat: 80

# 客户端向服务端发送 这里的 Heartbeat 为间隔时间
  80/2 和 30 取最小值 30
Frame 10: 88 bytes on wire (704 bits), 88 bytes captured (704 bits)
Linux cooked capture
Internet Protocol Version 4, Src: 192.168.56.103, Dst: 192.168.56.101
Transmission Control Protocol, Src Port: 35664, Dst Port: 5672, Seq: 313, Ack: 508, Len: 20
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 12
    Class: Connection (10)
    Method: Tune-Ok (31)
    Arguments
        Channel-Max: 65535
        Frame-Max: 131072
        Heartbeat: 30

