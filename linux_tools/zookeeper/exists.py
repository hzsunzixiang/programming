#!/usr/bin/python
# -*- coding: UTF-8 -*-
from kazoo.client import KazooClient
from kazoo.client import KazooState

import time


zk = KazooClient(hosts='192.168.1.130:2181')


zk.start()

zk.ensure_path("/my/favorite1")
zk.ensure_path("/my/favorite2")

# Determine if a node exists
if zk.exists("/my/favorite"):
    # Do something
    print("exists")

# Print the version of a node and its data
data, stat = zk.get("/my/favorite")
print("Version: %s, data: %s" % (stat.version, data.decode("utf-8")))

# List the children
children = zk.get_children("/my")
print("There are %s children with names %s" % (len(children), children))


time.sleep(10000)




	#17:34:28:617433 ConnectRequest(ver=0, zxid=0, timeout=10000, session=0x0, readonly=False, client=192.168.1.110:52918)
	#————►17:34:28:623169 ConnectReply(ver=0, timeout=10000, session=0x30009ee99630005, readonly=False, server=192.168.1.130:2181)

	#17:34:28:635108 ExistsRequest(xid=2, path=/my, watch=False, size=16, client=192.168.1.110:52918)
	#————►17:34:28:635663 ExistsReply(xid=2, zxid=34359738485, error=0, server=192.168.1.130:2181)
	
	#17:34:28:636227 CreateRequest(size=60, xid=3, path=/my/favorite1, ephemeral=False, sequence=False, client=192.168.1.110:52918)
	#————►17:34:28:639596 CreateReply(xid=3, zxid=34359738486, error=0, path=/my/favorite1, server=192.168.1.130:2181)
	#17:34:28:640713 ExistsRequest(xid=4, path=/my/favorite2, watch=False, size=26, client=192.168.1.110:52918)
	#————►17:34:28:641434 FailedExistsReply(xid=4, zxid=34359738486, error=-101, server=192.168.1.130:2181)
	#17:34:28:641964 ExistsRequest(xid=5, path=/my, watch=False, size=16, client=192.168.1.110:52918)
	#————►17:34:28:643220 ExistsReply(xid=5, zxid=34359738486, error=0, server=192.168.1.130:2181)
	#17:34:28:644335 CreateRequest(size=60, xid=6, path=/my/favorite2, ephemeral=False, sequence=False, client=192.168.1.110:52918)
	#————►17:34:28:646906 CreateReply(xid=6, zxid=34359738487, error=0, path=/my/favorite2, server=192.168.1.130:2181)
	#17:34:28:654152 ExistsRequest(xid=7, path=/my/favorite, watch=False, size=25, client=192.168.1.110:52918)
	#————►17:34:28:654429 ExistsReply(xid=7, zxid=34359738487, error=0, server=192.168.1.130:2181)
	#17:34:28:658420 GetDataRequest(xid=8, path=/my/favorite, watch=False, size=25, client=192.168.1.110:52918)
	#————►17:34:28:659069 GetDataReply(xid=8, zxid=34359738487, error=0, server=192.168.1.130:2181)
	#17:34:28:662216 GetChildrenRequest(xid=9, path=/my, watch=False, size=16, client=192.168.1.110:52918)
	#————►17:34:28:662643 GetChildrenReply(xid=9, zxid=34359738487, error=0, count=3, server=192.168.1.130:2181)




#ensure_path() will recursively create the node and any nodes in the path necessary along the way, but can not set the data for the node, only the ACL.


#	17:27:57:395484 ConnectRequest(ver=0, zxid=0, timeout=10000, session=0x0, readonly=False, client=192.168.1.110:52914)
#	————►17:27:57:401464 ConnectReply(ver=0, timeout=10000, session=0x30009ee99630003, readonly=False, server=192.168.1.130:2181)
#	17:27:57:412600 ExistsRequest(xid=2, path=/my, watch=False, size=16, client=192.168.1.110:52914)
#	————►17:27:57:414063 FailedExistsReply(xid=2, zxid=34359738479, error=-101, server=192.168.1.130:2181)
#	17:27:57:415427 ExistsRequest(xid=3, path=/, watch=False, size=14, client=192.168.1.110:52914)
#	————►17:27:57:415931 ExistsReply(xid=3, zxid=34359738479, error=0, server=192.168.1.130:2181)
#	17:27:57:417448 CreateRequest(size=50, xid=4, path=/my, ephemeral=False, sequence=False, client=192.168.1.110:52914)
#	————►17:27:57:421151 CreateReply(xid=4, zxid=34359738480, error=0, path=/my, server=192.168.1.130:2181)
#	17:27:57:422478 CreateRequest(size=59, xid=5, path=/my/favorite, ephemeral=False, sequence=False, client=192.168.1.110:52914)
#	————►17:27:57:427748 CreateReply(xid=5, zxid=34359738481, error=0, path=/my/favorite, server=192.168.1.130:2181)


