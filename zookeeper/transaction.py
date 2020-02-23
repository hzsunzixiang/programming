#!/usr/bin/python
# -*- coding: UTF-8 -*-
from kazoo.client import KazooClient
from kazoo.client import KazooState

import time

zk = KazooClient(hosts='192.168.1.130:2181')
zk.start()

transaction = zk.transaction()
transaction.check('/node/a', version=3)
transaction.create('/node/b', b"a value")
results = transaction.commit()
print("results:%s"%(results,))

# KeyboardInterrupt
# ericksun@debian-1:~/programming/zookeeper$ ./transaction.py
# results:[NoNodeError(), RuntimeInconsistency()]

time.sleep(10000)

