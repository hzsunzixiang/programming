#!/usr/local/services/python/bin/python
# -*- coding: utf-8 -*-

import sys
from vsresource.common.http_op import CHttpOp


class CBaseOp(object):
    def process(self):
        print("in file [%s], [CBaseOp] class\t:%s, function name :%s" % (
            __file__, self.__class__, sys._getframe().f_code.co_name))
        self.do_process()


class CHttpOp(CBaseOp):

    def do_process(self):
        print("in file [%s], [CHttpOp]class\t:%s, function name :%s" % (
            __file__, self.__class__, sys._getframe().f_code.co_name))
        print('%s send--------' % (self.get_module_name()))
