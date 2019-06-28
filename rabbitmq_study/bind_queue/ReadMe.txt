
删除队列

sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete queue name=TEST


    Class: Queue (50)
#    Method: Bind (20)

Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 30
    Class: Queue (50)
    Method: Bind (20)
    Arguments
        Ticket: 0
        Queue: TEST
        Exchange: vstation
        Routing-Key: TEST
        .... ...0 = Nowait: False
        Arguments

#    Method: Bind-Ok (21)
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 4
    Class: Queue (50)
    Method: Bind-Ok (21)
    Arguments

