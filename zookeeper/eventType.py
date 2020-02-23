#!/usr/bin/python
# -*- coding: UTF-8 -*-
from kazoo.client import KazooClient
from kazoo.client import KazooState

import time


# https://kazoo.readthedocs.io/en/latest/api/recipe/watchers.html

zk = KazooClient(hosts='192.168.1.130:2181')

#@client.DataWatch('/path/to/watch')
#def my_func(data, stat):
#    print("Data is %s" % data)
#    print("Version is %s" % stat.version)

# Above function is called immediately and prints

# Or if you want the event object
@zk.DataWatch('/ericksun')
def my_func(data, stat, event):
    print("Data is %s" % data)
    print("Version is %s" % stat.version)
    print("Event is %s" % event)


#@zk.ChildrenWatch('/path/to/watch')
#def my_func(children):
#    print "Children are %s" % children

# Above function is called immediately and prints children


zk.start()

time.sleep(10000)

#class EventType(object):
#    """Zookeeper Event
#
#    Represents a Zookeeper event. Events trigger watch functions which
#    will receive a :class:`EventType` attribute as their event
#    argument.
#
#    .. attribute:: CREATED
#
#        A node has been created.
#
#    .. attribute:: DELETED
#
#        A node has been deleted.
#
#    .. attribute:: CHANGED
#
#        The data for a node has changed.
#
#    .. attribute:: CHILD
#
#        The children under a node have changed (a child was added or
#        removed). This event does not indicate the data for a child
#        node has changed, which must have its own watch established.
#
#    .. attribute:: NONE
#
#        The connection state has been altered.
#
#    """
#    CREATED = 'CREATED'
#    DELETED = 'DELETED'
#    CHANGED = 'CHANGED'
#    CHILD = 'CHILD'
#    NONE = 'NONE'
#
#EVENT_TYPE_MAP = {
#    -1: EventType.NONE,
#    1: EventType.CREATED,
#    2: EventType.DELETED,
#    3: EventType.CHANGED,
#    4: EventType.CHILD
#}

