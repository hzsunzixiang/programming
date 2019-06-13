#!/usr/bin/env python3
# -*- coding:UTF-8
# 多个协程并发请求。用于多个请求无依赖关系的场景，耗时依赖其中最长的耗时请求

# 框架主入口
import json
import uuid
import framework
#import framework.log as log
from framework import context
from framework.static import tid_requestid_map
import os
import threading
import time
import traceback
from framework.static import init_context
from framework.static import clear_context
from framework.static import get_current_request_id
from framework.concurrency import concurrent_execute


if __name__ == '__main__':
   init_context() 
   print(tid_requestid_map)
   def test1():
       print('test1')
       gevent.sleep(11)
       return 'test1'

   def test2():
       print('test2 will raise exception')
       gevent.sleep(1)
       raise Exception('test2')

   def test3(a, b):
       print('test3 %d %d' % (a, b))
       gevent.sleep(3)
       return 'test3'

   tasks = [(test1,), (test2, ), (test3, 1, 2)]
   results = concurrent_execute(tasks)
