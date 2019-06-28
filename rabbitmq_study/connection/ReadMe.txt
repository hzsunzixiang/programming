connection 10 work with socket connections

start 10 start connection negotiation
start­ok 11 select security mechanism and locale
secure 20 security mechanism challenge
secure­ok 21 security mechanism response
tune 30 propose connection tuning parameters
tune­ok 31 negotiate connection tuning parameters
open 40 open connection to virtual host
open­ok 41 signal that connection is ready
close 50 request a connection close
close­ok 51 confirm a connection close


#

Frame 4: 96 bytes on wire (768 bits), 96 bytes captured (768 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 40502, Dst Port: 5672, Seq: 1, Ack: 1, Len: 8
Advanced Message Queueing Protocol
    Protocol: AMQP
    Protocol ID Major: 0
    Protocol ID Minor: 0
    Version Major: 9
    Version Minor: 1

# Method: Start (10)

Frame 6: 578 bytes on wire (4624 bits), 578 bytes captured (4624 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 5672, Dst Port: 40502, Seq: 1, Ack: 9, Len: 490
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 482
    Class: Connection (10)
    Method: Start (10)
    Arguments
        Version-Major: 0
        Version-Minor: 9
        Server-Properties
            capabilities (field table)
                publisher_confirms (boolean): true
                exchange_exchange_bindings (boolean): true
                basic.nack (boolean): true
                consumer_cancel_notify (boolean): true
                connection.blocked (boolean): true
                consumer_priorities (boolean): true
                authentication_failure_close (boolean): true
                per_consumer_qos (boolean): true
                direct_reply_to (boolean): true
            cluster_name (string): rabbit@debian9-1
            copyright (string): Copyright (C) 2007-2016 Pivotal Software, Inc.
            information (string): Licensed under the MPL.  See http://www.rabbitmq.com/
            platform (string): Erlang/OTP
            product (string): RabbitMQ
            version (string): 3.6.6
        Mechanisms: 504c41494e20414d51504c41494e
        Locales: 656e5f5553

#    Method: Start-Ok (11)
Frame 8: 392 bytes on wire (3136 bits), 392 bytes captured (3136 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 40502, Dst Port: 5672, Seq: 9, Ack: 491, Len: 304
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 296
    Class: Connection (10)
    Method: Start-Ok (11)
    Arguments
        Client-Properties
            platform (string): Python 2.7.13
            product (string): Pika Python Client Library
            version (string): 1.0.1
            capabilities (field table)
                connection.blocked (boolean): true
                authentication_failure_close (boolean): true
                consumer_cancel_notify (boolean): true
                publisher_confirms (boolean): true
                basic.nack (boolean): true
            information (string): See http://pika.rtfd.org
        Mechanism: PLAIN
        Response: 007673746174696f6e007673746174696f6e
        Locale: en_US

 
# Method: Tune (30)
Frame 9: 108 bytes on wire (864 bits), 108 bytes captured (864 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 5672, Dst Port: 40502, Seq: 491, Ack: 313, Len: 20
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 12
    Class: Connection (10)
    Method: Tune (30)
    Arguments
        Channel-Max: 0
        Frame-Max: 131072
        Heartbeat: 60

# Method: Tune-Ok (31)
Frame 10: 108 bytes on wire (864 bits), 108 bytes captured (864 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 40502, Dst Port: 5672, Seq: 313, Ack: 511, Len: 20
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 12
    Class: Connection (10)
    Method: Tune-Ok (31)
    Arguments
        Channel-Max: 65535
        Frame-Max: 131072
        Heartbeat: 60


# Method: Open (40)
Frame 11: 111 bytes on wire (888 bits), 111 bytes captured (888 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 40502, Dst Port: 5672, Seq: 333, Ack: 511, Len: 23
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 15
    Class: Connection (10)
    Method: Open (40)
    Arguments
        Virtual-Host: vstation
        Capabilities: 
        .... ...1 = Insist: True

#    Method: Open-Ok (41)
Frame 13: 101 bytes on wire (808 bits), 101 bytes captured (808 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 5672, Dst Port: 40502, Seq: 511, Ack: 356, Len: 13
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 5
    Class: Connection (10)
    Method: Open-Ok (41)
    Arguments
        Known-Hosts: 


#    Method: Close (50)

Frame 15: 122 bytes on wire (976 bits), 122 bytes captured (976 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 40502, Dst Port: 5672, Seq: 356, Ack: 524, Len: 34
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 26
    Class: Connection (10)
    Method: Close (50)
    Arguments
        Reply-Code: 200
        Reply-Text: Normal shutdown
        Class-Id: 0
        Method-Id: 0

# Method: Close-Ok (51)
Frame 16: 100 bytes on wire (800 bits), 100 bytes captured (800 bits)
Linux cooked capture
Internet Protocol Version 6, Src: ::1, Dst: ::1
Transmission Control Protocol, Src Port: 5672, Dst Port: 40502, Seq: 524, Ack: 390, Len: 12
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 4
    Class: Connection (10)
    Method: Close-Ok (51)
    Arguments

