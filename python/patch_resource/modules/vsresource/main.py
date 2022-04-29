#!/usr/local/services/python/bin/python
# -*- coding: utf-8 -*-

from conf.config import VSRESOURCE_PATCH_HANDLER

from common.http_op import CHttpOp
import sys


class CBcmdbOp(CHttpOp):
    def get_module_name(self):
        print("in file [%s], [CBcmdbOp] class\t:%s, function name :%s" % (
            __file__, self.__class__, sys._getframe().f_code.co_name))
        return 'bcmdb'


class CBcmdbRemoveDeviceOp(CBcmdbOp):
    def do_process(self):
        print("in file [%s], [CBcmdbRemoveDeviceOp] class\t:%s, function name :%s" % (
            __file__, self.__class__, sys._getframe().f_code.co_name))

        super(CBcmdbRemoveDeviceOp, self).do_process()


class CRemoveVmCmdbHandle(CBcmdbRemoveDeviceOp):
    pass


def dispatch_handle(method, b_log=True):
    if method.lower() in ('removeVmCmdb'.lower(),):
        return CRemoveVmCmdbHandle()


def process(command, data):
    print("in file [%s], this is the process of vsresource" % (__file__))
    handle = dispatch_handle(command)
    ret = handle.process()
    return True


def handler(module, command, data):
    if VSRESOURCE_PATCH_HANDLER is not None:
        import importlib
        _module = importlib.import_module(VSRESOURCE_PATCH_HANDLER)
        # 这里到了 vstation_onebank中
        # vstation_onebank 中 def patch_handler(module, command, data):
        ret = _module.patch_handler(module, command, data)
        if ret is not None:
            return ret
        else:
            print("in file [%s], not patch command[%s]" % (__file__, command))

    # do process
    ret = process(command, data)
    return ret


if __name__ == '__main__':
    print(handler('xx', 'generateCloneVolume', {'hostIp': '10.207.131.49'}))
