#!/usr/bin/env python3
# -*- coding:UTF-8
# 多个协程并发请求。用于多个请求无依赖关系的场景，耗时依赖其中最长的耗时请求

# 框架主入口
import json
import uuid
import gevent 
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
from framework.static import global_context


if __name__ == '__main__':
    init_context() 

    context.ResultFilters={}
    context.ResultFilters['statusList'] = "hello"
    print(context.keys())
    print(global_context)


