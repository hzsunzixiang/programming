#!/usr/bin/python
# -*- coding: UTF-8 -*-
from kazoo.client import KazooClient

zk = KazooClient(hosts='127.0.0.1:2181')
zk.start()

import time
time.sleep(10000)

