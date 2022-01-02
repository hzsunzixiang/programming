
erl -noshell -s udp_test start -s init stop


2 个字节打头
# 参数为 5
Frame 1: 47 bytes on wire (376 bits), 47 bytes captured (376 bits)
Linux cooked capture v1
Internet Protocol Version 4, Src: 127.0.0.1, Dst: 127.0.0.1
User Datagram Protocol, Src Port: 60756, Dst Port: 4000
Data (3 bytes)
    Data: 836105
    [Length: 3]

# 返回 120 = 0x 78
Frame 2: 47 bytes on wire (376 bits), 47 bytes captured (376 bits)
Linux cooked capture v1
Internet Protocol Version 4, Src: 127.0.0.1, Dst: 127.0.0.1
User Datagram Protocol, Src Port: 4000, Dst Port: 60756
Data (3 bytes)
    Data: 836178
    [Length: 3]

