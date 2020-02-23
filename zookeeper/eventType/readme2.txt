

https://kazoo.readthedocs.io/en/latest/_modules/kazoo/protocol/states.html#KazooState

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


1. 对节点做操作
# 创建一个节点
16:59:26:751531 EventNodeCreated(state=3, path=/ericksun, client=192.168.1.110:52877, server=192.168.1.130:2181)
16:59:26:754286 GetDataRequest(xid=18, path=/ericksun, watch=True, size=22, client=192.168.1.110:52877)
————►16:59:26:754897 GetDataReply(xid=18, zxid=34359738432, error=0, server=192.168.1.130:2181)




# 为一个节点设置值

16:59:54:996466 EventNodeDataChanged(state=3, path=/ericksun, client=192.168.1.110:52877, server=192.168.1.130:2181)
16:59:54:998354 GetDataRequest(xid=19, path=/ericksun, watch=True, size=22, client=192.168.1.110:52877)
————►16:59:54:999535 GetDataReply(xid=19, zxid=34359738433, error=0, server=192.168.1.130:2181)



# 改变这个 节点的值

17:00:17:472401 EventNodeDataChanged(state=3, path=/ericksun, client=192.168.1.110:52877, server=192.168.1.130:2181)
17:00:17:474975 GetDataRequest(xid=20, path=/ericksun, watch=True, size=22, client=192.168.1.110:52877)
————►17:00:17:475677 GetDataReply(xid=20, zxid=34359738434, error=0, server=192.168.1.130:2181)



# 删除节点 

17:02:10:499669 EventNodeDeleted(state=3, path=/ericksun, client=192.168.1.110:52877, server=192.168.1.130:2181)
17:02:10:501619 GetDataRequest(xid=21, path=/ericksun, watch=True, size=22, client=192.168.1.110:52877)
————►17:02:10:502167 FailedGetDataReply(xid=21, zxid=34359738439, error=-101, server=192.168.1.130:2181)
17:02:10:502487 ExistsRequest(xid=22, path=/ericksun, watch=True, size=22, client=192.168.1.110:52877)
————►17:02:10:502924 FailedExistsReply(xid=22, zxid=34359738439, error=-101, server=192.168.1.130:2181)



2. 对child做操作

# 创建一个节点
17:06:27:789642 EventNodeChildrenChanged(state=3, path=/ericksun, client=192.168.1.110:52882, server=192.168.1.130:2181)
17:06:27:796450 GetChildrenRequest(xid=2, path=/ericksun, watch=True, size=22, client=192.168.1.110:52882)
————►17:06:27:797036 GetChildrenReply(xid=2, zxid=34359738447, error=0, count=3, server=192.168.1.130:2181)





# 删除一个节点
17:06:49:648997 EventNodeChildrenChanged(state=3, path=/ericksun, client=192.168.1.110:52882, server=192.168.1.130:2181)
17:06:49:650948 GetChildrenRequest(xid=3, path=/ericksun, watch=True, size=22, client=192.168.1.110:52882)
————►17:06:49:651565 GetChildrenReply(xid=3, zxid=34359738448, error=0, count=2, server=192.168.1.130:2181)


