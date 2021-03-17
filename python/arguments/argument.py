#!/usr/bin/env python
# -*- coding=UTF-8 -*-
#
# retry_publish_para 不为None，说明有消息要发送
def run_executor(key, callback, overhear=False, retry_publish_para=None):
    print("retry_publish_para:%s"%(retry_publish_para["exchange"],))





key=1
callback=2
overhear=False

retry_publish_para = {"exchange":"vstation", "routing_key":"FLOW", "body": "Hello,world", "properties":"properties"}
run_executor(key, callback, overhear, retry_publish_para)

if isinstance(retry_publish_para, dict):
    print("is dict")


not_dict = None

if not isinstance(not_dict, dict):
    print("is not dict")
