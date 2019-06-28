
删除队列

sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete queue name=TEST

    Class: Queue (50)
#    Method: Declare (10)

Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 16
    Class: Queue (50)
    Method: Declare (10)
    Arguments
        Ticket: 0
        Queue: TEST
        .... ...0 = Passive: False
        .... ..0. = Durable: False
        .... .0.. = Exclusive: False
        .... 0... = Auto-Delete: False
        ...0 .... = Nowait: False
        Arguments

#    Method: Declare-Ok (11)
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 17
    Class: Queue (50)
    Method: Declare-Ok (11)
    Arguments
        Queue: TEST
        Message-Count: 0
        Consumer-Count: 0

