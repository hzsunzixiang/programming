
删除队列

sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete queue name=TEST

    Class: Queue (50)
#    Method: Purge (30)
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 12
    Class: Queue (50)
    Method: Purge (30)
    Arguments
        Ticket: 0
        Queue: TEST
        .... ...0 = Nowait: False

#
    Method: Purge-Ok (31)
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 8
    Class: Queue (50)
    Method: Purge-Ok (31)
    Arguments
        Message-Count: 5

