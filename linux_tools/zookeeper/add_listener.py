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

#classkazoo.protocol.states.KazooState[source]
#High level connection state values
#
#States inspired by Netflix Curator.
#
#SUSPENDED
#The connection has been lost but may be recovered. We should operate in a “safe mode” until then. When the connection is resumed, it may be discovered that the session expired. A client should not assume that locks are valid during this time.
#
#CONNECTED
#The connection is alive and well.
#
#LOST
#The connection has been confirmed dead. Any ephemeral nodes will need to be recreated upon re-establishing a connection. If locks were acquired or recipes using ephemeral nodes are in use, they can be considered lost as well.
#
#Listening for Connection Events
#It can be useful to know when the connection has been dropped, restored, or when the Zookeeper session has expired. To simplify this process Kazoo uses a state system and lets you register listener functions to be called when the state changes.
#
#from kazoo.client import KazooState
#
#def my_listener(state):
#    if state == KazooState.LOST:
#        # Register somewhere that the session was lost
#    elif state == KazooState.SUSPENDED:
#        # Handle being disconnected from Zookeeper
#    else:
#        # Handle being connected/reconnected to Zookeeper
#
#zk.add_listener(my_listener)
#When using the kazoo.recipe.lock.Lock or creating ephemeral nodes, its highly recommended to add a state listener so that your program can properly deal with connection interruptions or a Zookeeper session loss.
#add_listener(listener)[source]
#Add a function to be called for connection state changes.
#
#This function will be called with a KazooState instance indicating the new connection state on state transitions.
#
#Warning
#
#This function must not block. If its at all likely that it might need data or a value that could result in blocking than the spawn() method should be used so that the listener can return immediately.
#
#
#    def add_listener(self, listener):
#        """Add a function to be called for connection state changes.
#
#        This function will be called with a
#        :class:`~kazoo.protocol.states.KazooState` instance indicating
#        the new connection state on state transitions.
#
#        .. warning::
#
#            This function must not block. If its at all likely that it
#            might need data or a value that could result in blocking
#            than the :meth:`~kazoo.interfaces.IHandler.spawn` method
#            should be used so that the listener can return immediately.
#
#        """
#        if not (listener and callable(listener)):
#            raise ConfigurationError("listener must be callable")
#        self.state_listeners.add(listener)
