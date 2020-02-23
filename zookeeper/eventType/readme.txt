







# EventNodeDataChanged
抓包文件 dataType.pcap
## 第一次连接
16:07:39:778440 ConnectRequest(ver=0, zxid=0, timeout=10000, session=0x0, readonly=False, client=192.168.1.110:52859)
————►16:07:39:784047 ConnectReply(ver=0, timeout=10000, session=0x30009805bd40008, readonly=False, server=192.168.1.130:2181)

16:07:39:785114 GetDataRequest(xid=1, path=/ericksun, watch=True, size=22, client=192.168.1.110:52859)
————►16:07:39:786378 GetDataReply(xid=1, zxid=34359738391, error=0, server=192.168.1.130:2181)


## 数据改变时

服务端通知
16:07:49:515791 EventNodeDataChanged(state=3, path=/ericksun, client=192.168.1.110:52859, server=192.168.1.130:2181)
客户端获取
16:07:49:519941 GetDataRequest(xid=2, path=/ericksun, watch=True, size=22, client=192.168.1.110:52859)
服务端返回
————►16:07:49:520554 GetDataReply(xid=2, zxid=34359738392, error=0, server=192.168.1.130:2181)



# EventNodeChildrenChanged

抓包文件 childrenType.pcap
ericksun@debian-1:~$ sudo zk-dump  --iface eth0

## 第一次连接时
16:45:07:439717 ConnectRequest(ver=0, zxid=0, timeout=10000, session=0x0, readonly=False, client=192.168.1.110:52872)
————►16:45:07:444713 ConnectReply(ver=0, timeout=10000, session=0x30009805bd4000f, readonly=False, server=192.168.1.130:2181)
16:45:07:446888 GetChildrenRequest(xid=1, path=/ericksun, watch=True, size=22, client=192.168.1.110:52872)
————►16:45:07:447239 GetChildrenReply(xid=1, zxid=34359738407, error=0, count=1, server=192.168.1.130:2181)




## children改变时 
16:45:17:220295 EventNodeChildrenChanged(state=3, path=/ericksun, client=192.168.1.110:52872, server=192.168.1.130:2181)
## 获取
16:45:17:222388 GetChildrenRequest(xid=2, path=/ericksun, watch=True, size=22, client=192.168.1.110:52872)
## server 返回
————►16:45:17:222921 GetChildrenReply(xid=2, zxid=34359738408, error=0, count=2, server=192.168.1.130:2181)



