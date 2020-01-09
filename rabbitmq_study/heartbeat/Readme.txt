

# 服务端向客户端发送 Tune 包
    Method: Tune (30)

Frame 9: 88 bytes on wire (704 bits), 88 bytes captured (704 bits)
Linux cooked capture
Internet Protocol Version 4, Src: 192.168.56.101, Dst: 192.168.56.103
Transmission Control Protocol, Src Port: 5672, Dst Port: 35422, Seq: 488, Ack: 313, Len: 20
    Source Port: 5672
    Destination Port: 35422
    [Stream index: 0]
    [TCP Segment Len: 20]
    Sequence number: 488    (relative sequence number)
    [Next sequence number: 508    (relative sequence number)]
    Acknowledgment number: 313    (relative ack number)
    1000 .... = Header Length: 32 bytes (8)
    Flags: 0x018 (PSH, ACK)
    Window size value: 235
    [Calculated window size: 30080]
    [Window size scaling factor: 128]
    Checksum: 0xf257 [unverified]
    [Checksum Status: Unverified]
    Urgent pointer: 0
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
    [SEQ/ACK analysis]
    [Timestamps]
    TCP payload (20 bytes)
    [PDU Size: 20]
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 12
    Class: Connection (10)
    Method: Tune (30)
    Arguments
        Channel-Max: 0
        Frame-Max: 131072
        Heartbeat: 80     --------------------------- 这里协商的Heartbeat

# 客户端回包 
    Method: Tune-Ok (31)    --- 

Frame 10: 88 bytes on wire (704 bits), 88 bytes captured (704 bits)
Linux cooked capture
Internet Protocol Version 4, Src: 192.168.56.103, Dst: 192.168.56.101
Transmission Control Protocol, Src Port: 35422, Dst Port: 5672, Seq: 313, Ack: 508, Len: 20
    Source Port: 35422
    Destination Port: 5672
    [Stream index: 0]
    [TCP Segment Len: 20]
    Sequence number: 313    (relative sequence number)
    [Next sequence number: 333    (relative sequence number)]
    Acknowledgment number: 508    (relative ack number)
    1000 .... = Header Length: 32 bytes (8)
    Flags: 0x018 (PSH, ACK)
    Window size value: 237
    [Calculated window size: 30336]
    [Window size scaling factor: 128]
    Checksum: 0x4b2a [unverified]
    [Checksum Status: Unverified]
    Urgent pointer: 0
    Options: (12 bytes), No-Operation (NOP), No-Operation (NOP), Timestamps
    [SEQ/ACK analysis]
    [Timestamps]
    TCP payload (20 bytes)
    [PDU Size: 20]
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 12
    Class: Connection (10)
    Method: Tune-Ok (31)    --- 
    Arguments
        Channel-Max: 65535
        Frame-Max: 131072
        Heartbeat: 80     --------------------------- 这里协商的Heartbeat

