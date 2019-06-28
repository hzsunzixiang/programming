
删除 exchange

sudo rabbitmqadmin -u vstation -p vstation -V vstation  delete exchange name=vstation

    Class: Exchange (40)

#    Method: Delete (20)
Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 16
    Class: Exchange (40)
    Method: Delete (20)
    Arguments
        Ticket: 0
        Exchange: vstation
        .... ...0 = If-Unused: False
        .... ..0. = Nowait: False

# Method: Delete-Ok (21)
 Advanced Message Queueing Protocol
    Type: Method (1)
    Channel: 1
    Length: 4
    Class: Exchange (40)
    Method: Delete-Ok (21)
    Arguments

