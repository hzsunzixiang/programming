

# The value of the expiration field describes the TTL period in milliseconds.
# https://www.rabbitmq.com/ttl.html

frame­method 1
frame­header 2
frame- body  3

    Type: Method (1)
    Method: Consume (20)

Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 55
    Class: Basic (60)
    Method: Consume (20)
    Arguments
        Ticket: 0
        Queue: TEST
        Consumer-Tag: ctag1.9692accd12dc4285974054220295348c
        .... ...0 = No-Local: False
        .... ..1. = No-Ack: True
        .... .0.. = Exclusive: False
        .... 0... = Nowait: False
        Filter

# Method: Consume-Ok (21)
# Method: Deliver (60)

Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 43
    Class: Basic (60)
    Method: Consume-Ok (21)
    Arguments
        Consumer-Tag: ctag1.9692accd12dc4285974054220295348c


Frame 23: 643 bytes on wire (5144 bits), 643 bytes captured (5144 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 5672, Dst Port: 36918, Seq: 588, Ack: 529, Len: 555
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 43
    Class: Basic (60)
    Method: Consume-Ok (21)
    Arguments
        Consumer-Tag: ctag1.9692accd12dc4285974054220295348c
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 66
    Class: Basic (60)
    Method: Deliver (60)
    Arguments
        Consumer-Tag: ctag1.9692accd12dc4285974054220295348c
        Delivery-Tag: 1
        .... ...0 = Redelivered: False
        Exchange: vstation
        Routing-Key: TEST
Advanced Message Queueing Protocol
    Type: Content header (2)
    Channel: 1
    Length: 24
    Class ID: Basic (60)
    Weight: 0
    Body size: 12
    Property flags: 0x1100
    Properties
        Delivery-Mode: 2
        Expiration: 10000000
Advanced Message Queueing Protocol
    Type: Content body (3)
    Channel: 1
    Length: 12
    Payload: 48656c6c6f20576f726c6421
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 66
    Class: Basic (60)
    Method: Deliver (60)
    Arguments
        Consumer-Tag: ctag1.9692accd12dc4285974054220295348c
        Delivery-Tag: 2
        .... ...0 = Redelivered: False
        Exchange: vstation
        Routing-Key: TEST
Advanced Message Queueing Protocol
    Type: Content header (2)
    Channel: 1
    Length: 24
    Class ID: Basic (60)
    Weight: 0
    Body size: 12
    Property flags: 0x1100
    Properties
        Delivery-Mode: 2
        Expiration: 10000000
Advanced Message Queueing Protocol
    Type: Content body (3)
    Channel: 1
    Length: 12
    Payload: 48656c6c6f20576f726c6421
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 66
    Class: Basic (60)
    Method: Deliver (60)
    Arguments
        Consumer-Tag: ctag1.9692accd12dc4285974054220295348c
        Delivery-Tag: 3
        .... ...0 = Redelivered: False
        Exchange: vstation
        Routing-Key: TEST
Advanced Message Queueing Protocol
    Type: Content header (2)
    Channel: 1
    Length: 24
    Class ID: Basic (60)
    Weight: 0
    Body size: 12
    Property flags: 0x1100
    Properties
        Delivery-Mode: 2
        Expiration: 10000000
Advanced Message Queueing Protocol
    Type: Content body (3)
    Channel: 1
    Length: 12
    Payload: 48656c6c6f20576f726c6421
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 66
    Class: Basic (60)
    Method: Deliver (60)
    Arguments
        Consumer-Tag: ctag1.9692accd12dc4285974054220295348c
        Delivery-Tag: 4
        .... ...0 = Redelivered: False
        Exchange: vstation
        Routing-Key: TEST
Advanced Message Queueing Protocol
    Type: Content header (2)
    Channel: 1
    Length: 24
    Class ID: Basic (60)
    Weight: 0
    Body size: 12
    Property flags: 0x1100
    Properties
        Delivery-Mode: 2
        Expiration: 10000000
Advanced Message Queueing Protocol
    Type: Content body (3)
    Channel: 1
    Length: 12
    Payload: 48656c6c6f20576f726c6421

