#!/usr/local/services/python/bin/python
# -*- coding: utf-8 -*-

import sys
class CBaseOp(object):
    def process(self):
        print("in file [%s], [CBaseOp]class\t:%s, function name :%s" % (
            __file__, self.__class__, sys._getframe().f_code.co_name))
        return self.do_process()

    #
    # def do_process(self):
    #     print("ssssss" + self.test)
    def do_process(self):
        print("in file [%s], [CBaseOp]class\t:%s, function name :%s" % (
            __file__, self.__class__, sys._getframe().f_code.co_name))
        print('%s send------- in patch.....' % (self.get_module_name()))
        print('success in in patch..... call test:%s' % (self.test))
        return True


class CHttpOp(CBaseOp):
    pass


