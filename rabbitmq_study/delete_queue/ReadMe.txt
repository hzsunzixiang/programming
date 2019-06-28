
删除队列

sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete queue name=TEST

    Class: Queue (50)

#    Method: Delete (40)

Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 12
    Class: Queue (50)
    Method: Delete (40)
    Arguments
        Ticket: 0
        Queue: TEST
        .... ...0 = If-Unused: False
        .... ..0. = If-Empty: False
        .... .0.. = Nowait: False


# Method: Delete-Ok (41)
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 8
    Class: Queue (50)
    Method: Delete-Ok (41)
    Arguments
        Message-Count: 0

