#!/usr/bin/env python
# -*- coding: utf-8 -*-

from vstation_onebank.cmdb_handle import (CRemoveVmCmdbHandle)

def process(command, data):

    func_map = {
        # 'importVmCmdb': CImportVmFromCmdbHandle,  # 已经下线
        'removeVmCmdb': CRemoveVmCmdbHandle,
    }
    func_map = dict((k.lower(), v) for k, v in func_map.items())
    handle = func_map.get(command.lower(), None)
    if handle is None:
        return (-1, 'not found command[%s]' % command, {})
    _handle = handle()
    return _handle.process()


def patch_handler(module, command, data):
    """
    patch already module some command
    :param module:
    :param command:
    :param data:
    :return:
    """
    patch_handler_map = {
        'vsresourceCmdb': ['removeVmCmdb', 'updateVmCmdbStatus'],
    }
    print data
    if command in patch_handler_map.get(module, []):
        return process(command, data)
    else:
        pass


def handler(module, command, data):
    """自己监听MQ任务"""
    return process(command, data)
