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

from kazoo.client import KazooState
from kazoo.client import KeeperState

zk = KazooClient(hosts='192.168.1.130:2181')

@zk.add_listener
def watch_for_ro(state):
    if state == KazooState.CONNECTED:
        if zk.client_state == KeeperState.CONNECTED_RO:
            print("Read only mode!")
        else:
            print("Read/Write mode!")

    if zk.client_state == KeeperState.CONNECTING:
        print("CONNECTING!")
    else:
        print("not CONNECTING!")

    if zk.client_state == KeeperState.CLOSED:
        print("CLOSED!")
    else:
        print("not CLOSED!")

#    AUTH_FAILED = 'AUTH_FAILED'
#    CONNECTED = 'CONNECTED'
#    CONNECTED_RO = 'CONNECTED_RO'
#    CONNECTING = 'CONNECTING'
#    CLOSED = 'CLOSED'
#    EXPIRED_SESSION = 'EXPIRED_SESSION'


zk.add_listener(my_listener)

zk.start()

time.sleep(10000)


#ericksun@debian-1:~/programming/zookeeper$ ./keeperState.py
#Read/Write mode!
#KazooState.CONNECTED


#class KeeperState(object):
#    """Zookeeper State
#
#    Represents the Zookeeper state. Watch functions will receive a
#    :class:`KeeperState` attribute as their state argument.
#
#    .. attribute:: AUTH_FAILED
#
#        Authentication has failed, this is an unrecoverable error.
#
#    .. attribute:: CONNECTED
#
#        Zookeeper is connected.
#
#    .. attribute:: CONNECTED_RO
#
#        Zookeeper is connected in read-only state.
#
#    .. attribute:: CONNECTING
#
#        Zookeeper is currently attempting to establish a connection.
#
#    .. attribute:: EXPIRED_SESSION
#
#        The prior session was invalid, all prior ephemeral nodes are
#        gone.
#
#    """
#    AUTH_FAILED = 'AUTH_FAILED'
#    CONNECTED = 'CONNECTED'
#    CONNECTED_RO = 'CONNECTED_RO'
#    CONNECTING = 'CONNECTING'
#    CLOSED = 'CLOSED'
#    EXPIRED_SESSION = 'EXPIRED_SESSION'

