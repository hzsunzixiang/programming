
删除队列

sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete queue name=TEST



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

