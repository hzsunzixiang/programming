#!/usr/bin/env python
# -*- coding:UTF-8

# coding:utf-8
import time
import json
import traceback

class BaseAdapter(object):
    """
    通用网络协议抽象基类
    具体使用方式暂时可以参考各个子类，有时间待扩充
    """
    rewrite = {}  # 接口名重写，非常不推荐使用的功能

    def __init__(self):
        """
        加载必要的信息
        """
        keyword_set = {'url', 'headers', 'hostname'}
        for attr in list(self.__class__.__dict__.keys()):

            if (attr not in keyword_set and '_' != attr[0]) and callable(self.__getattribute__(attr)):
                self.__setattr__(attr, self.__getattr__(attr))
    def _request(self, *l, **k):
        """
        发送请求的主逻辑
        """
        print("k:%s"% k)
        data = {}
        if k:
            data.update(k)

        if l and isinstance(l[0], dict):
            data.update(l[0])

        if l and isinstance(l[0], list):
            data = l[0]

        interface = k['attr']
        print("k[attr]:%s"% k['attr'])
        del (k['attr'])
        return "123"

    def __getattr__(self, attr_name):
        """
        支持动态方法，即使在Adapter中没有定义也能够调用。
        """
        print("attr_name:%s"% attr_name)

        def wrap(*l, **args):
            print("l:%s"%(args))
            print("l:%s"%(l,))
            return self._request(attr=attr_name, *l, **args)
            #return "hello,world"

        # 之前是 lambda 实现的，改为这个实现以对 log 友好。
        wrap.func_name = "%s_of_%s" % (attr_name, self.component_name)
        print("func_name:%s"% wrap.func_name)
        print("func_name:%s"% wrap)
        return wrap


