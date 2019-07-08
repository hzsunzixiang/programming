

https://www.rabbitmq.com/tutorials/amqp-concepts.html

Default Exchange
The default exchange is a direct exchange with no name (empty string) pre-declared by the broker. It has one special property that makes it very useful for simple applications: every queue that is created is automatically bound to it with a routing key which is the same as the queue name.

For example, when you declare a queue with the name of "search-indexing-online", the AMQP 0-9-1 broker will bind it to the default exchange using "search-indexing-online" as the routing key (in this context sometimes referred to as the binding key). Therefore, a message published to the default exchange with the routing key "search-indexing-online" will be routed to the queue "search-indexing-online". In other words, the default exchange makes it seem like it is possible to deliver messages directly to queues, even though that is not technically what is happening.



    Class: Connection (10)
#    Method: Open (40)

默认 Virtual-Host: /

Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 0
    Length: 8
    Class: Connection (10)
    Method: Open (40)
    Arguments
        Virtual-Host: /
        Capabilities: 
        .... ...1 = Insist: True



    Class: Basic (60)
#    Method: Publish (40)
此时的exchange 为空
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 14
    Class: Basic (60)
    Method: Publish (40)
    Arguments
        Ticket: 0
        Exchange: 
        Routing-Key: hello
        .... ...0 = Mandatory: False
        .... ..0. = Immediate: False

