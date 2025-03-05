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

# Event is WatchedEvent(type='CHANGED', state='CONNECTED', path=u'/ericksun')
# Data is sunzixiang
# Version is 6

# Or if you want the event object
@zk.DataWatch('/ericksun')
def my_func(data, stat, event):
    print("Event is %s" % (event, ))  # python2 一定要以这种方式打印, 是个tuple，否则打印有问题
    print("Data is %s" % data)
    print("Version is %s" % stat.version)


#@zk.ChildrenWatch('/path/to/watch')
#def my_func(children):
#    print "Children are %s" % children

# Above function is called immediately and prints children


zk.start()

time.sleep(10000)


#classkazoo.recipe.watchers.DataWatch(client, path, func=None, *args, **kwargs)[source]
#Watches a node for data updates and calls the specified function each time it changes
#
#The function will also be called the very first time its registered to get the data.
#
#Returning False from the registered function will disable future data change calls. If the client connection is closed (using the close command), the DataWatch will no longer get updates.
#  注意这一句 上面已验证
#If the function supplied takes three arguments, then the third one will be a WatchedEvent. It will only be set if the change to the data occurs as a result of the server notifying the watch that there has been a change. Events like reconnection or the first call will not include an event.
#
#If the node does not exist, then the function will be called with None for all values.
#
#Tip
#
#Because DataWatch can watch nodes that don’t exist, it can be used alternatively as a higher-level Exists watcher that survives reconnections and session loss.

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

