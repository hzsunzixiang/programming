# coding:utf-8
# 上下文与缓存抽象
import threading
import os
import sys
import cbor
import time
import hashlib
from framework.static import global_context
from framework.static import tid_requestid_map
from framework.static import _tid
import os


def compute_key(function, args, kwargs):
    key = cbor.dumps((function.__name__, args, kwargs))
    return hashlib.sha1(key).hexdigest()


def _get_current_context(uuid):
    try:
        return global_context[uuid]
    except KeyError:
        global_context[uuid] = {}
        return global_context[uuid]


class Context(object):
    """
        请求级别级别上下文
        协议要求：
            * 实现 memorize 装饰器
            * 实现 in 操作符
            * get 方法
            * 动态获取设置属性
            * 重载 [] 运算符，支持获取与设置
    """

    def memorize(self, function):
        def __memorize(*args, **kwargs):
            import context
            from copy import deepcopy
            cache = context.cache
            key = compute_key(function, args, kwargs)
            if key in cache:
                return deepcopy(cache[key])

            result = function(*args, **kwargs)
            cache[key] = result
            return deepcopy(result)

        return __memorize

    def __contains__(self, name):
        return name in _get_current_context(tid_requestid_map[_tid()])

    def __call__(self):
        self.__dict__ = {}

    def get(self, name, default=None):
        if name == '__wrapped__':
            return False
        try:
            return _get_current_context(tid_requestid_map[_tid()])[name]
        except KeyError:
            return default

    def __init__(self):
        pass

    def __getitem__(self, name):
        return _get_current_context(tid_requestid_map[_tid()])[name]

    def __getattr__(self, name):
        if name == '__wrapped__':
            return
        return _get_current_context(tid_requestid_map[_tid()])[name]

    def __setitem__(self, name, val):
        _get_current_context(tid_requestid_map[_tid()])[name] = val

    def __setattr__(self, name, val):
        _get_current_context(tid_requestid_map[_tid()])[name] = val

    def keys(self):
        return _get_current_context(tid_requestid_map[_tid()]).keys()


try:
    sys.modules['context'] = Context()
except:
    pass
try:
    sys.modules['framework.context'] = Context()
except:
    pass

