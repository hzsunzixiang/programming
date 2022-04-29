#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
用于onebank的cmdb协议

ONEBANK_BCMDB_CFG = {
    "host": "",
    "port": 80,
    "url": "/cmdb",
    "timeout: 30,
    "operator": "rtx",
    "system_id": "xx",
}
"""
import sys
from vsresource.common.http_op import CHttpOp


class CCmdbOp(CHttpOp):
    def get_module_name(self):
        print("in file [%s], [CCmdbOp] class\t:%s, function name :%s" % (
            __file__, self.__class__, sys._getframe().f_code.co_name))
        return 'onebank_cmdb'


class CRemoveVmCmdbOp(CCmdbOp):
    pass

    # def process(self):
    #     # dc对象
    #     print("in CRemoveVmCmdbOp")
    #     self.do_process()


if __name__ == '__main__':
    pass
    # data = {
    #     'migrateAsset': 'TYSV161023SK_VM053',
    #     'hostAsset': 'TYSV1610248H'
    # }
    # op = CMigrateVmSuccOp()
    # op.init(data)
    # print op.process()
