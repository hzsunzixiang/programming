

# The value of the expiration field describes the TTL period in milliseconds.
# https://www.rabbitmq.com/ttl.html

frame­method 1
frame­header 2
frame- body  3


#    Type: Method (1)
    Method: Publish (40)

Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 21
    Class: Basic (60)
    Method: Publish (40)
    Arguments
        Ticket: 0
        Exchange: vstation
        Routing-Key: TEST
        .... ...0 = Mandatory: False
        .... ..0. = Immediate: False





#    Type: Content header (2)

Advanced Message Queueing Protocol
    Type: Content header (2)
    Channel: 1
    Length: 22
    Class ID: Basic (60)
    Weight: 0
    Body size: 12
    Property flags: 0x1100
    Properties
        Delivery-Mode: 2
        Expiration: 100000

#    Type: Content body (3)

Advanced Message Queueing Protocol
    Type: Content body (3)
    Channel: 1
    Length: 12
    Payload: 48656c6c6f20576f726c6421

