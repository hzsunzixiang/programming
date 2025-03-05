#!/usr/bin/python
# -*- coding: UTF-8 -*-
from kazoo.client import KazooClient
from kazoo.client import KazooState

import time

def my_listener(state):
    if state == KazooState.LOST:
        # Register somewhere that the session was lost
        print("KazooState.LOST")
    elif state == KazooState.SUSPENDED:
        # Handle being disconnected from Zookeeper
        print("KazooState.SUSPENDED")
    else:
        # Handle being connected/reconnected to Zookeeper
        print("KazooState.%s"%(state))

zk = KazooClient(hosts='192.168.1.130:2181')

zk.add_listener(my_listener)

zk.start()

time.sleep(10000)


#	Valid State Transitions
#
#	LOST -> CONNECTED
#
#	New connection, or previously lost one becoming connected.
#
#	CONNECTED -> SUSPENDED
#
#	Connection loss to server occurred on a connection.
#
#	CONNECTED -> LOST
#
#	Only occurs if invalid authentication credentials are provided after the connection was established.
#
#	SUSPENDED -> LOST
#
#	Connection resumed to server, but then lost as the session was expired.
#
#	SUSPENDED -> CONNECTED
#
#	Connection that was lost has been restored.
