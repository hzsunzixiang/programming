#!/usr/local/services/python/bin/python
# -*- coding: utf-8 -*-

import json
import copy

# 探讨数据传递过程
# 基类
class CBaseOp(object):
    
    def __init__(self, b_log=True, b_host=False):
        self._in_data = None
        self._data = {}
    def init(self, data):
        print("in CBaseOp init the data is :%s "%(data))
        self._in_data = copy.deepcopy(data)
    def process(self):
        print("in CBaseOp process")
        try:
            self.do_process()
        except Exception as e:
            pass
    def do_process(self):
        pass


### handler相关
class CCbsCgwVolumeHandle(CBaseOp):
    def get_cbs_op(self):
        print("never go here, in CCbsCgwVolumeHandle get_cbs_op")
        return None

    def do_op_cbs(self, data):
        print("in CCbsCgwVolumeHandle do_op_cbs")
        op = self.get_cbs_op()
        op.init(data)  # 此时也有初始化
        reply = op.process()

    def do_process(self):
        print("in CCbsCgwVolumeHandle do_process")
        #在这里把参数穿进去，可能是根据参数各种操作得到的参数
        ret = self.do_op_cbs(self._in_data)

class CCbsCgwAttachVolumeHandle(CCbsCgwVolumeHandle):
    def get_cbs_op(self):
        # cbs-oss老接口，CCbsAttachDiskOp内部包含'ha_attach'字段，cbs-cgw无需此字段
        print("in CCbsCgwAttachVolumeHandle get_cbs_op")
        return CbsCgwAttachVolumeOp()

####### Op 相关
class CHttpOp(CBaseOp):
    def init(self, data):
        print("in CHttpOp init the data is :%s "%(data))
        ret = super(CHttpOp, self).init(data)

    def do_process(self):
        print("in CHttpOp do_process module_name:%s, interface_name:%s"%(self.get_module_name(), self.get_interface_name()))

    def get_module_name(self):
        return ''

class CCbsCgwOp(CHttpOp):

    def init(self, data):
        print("in CCbsCgwOp init the data is :%s "%(data))
        d_data = {
            'http': "CBSCGW_CFG",
            'data': data
        }
        return super(CCbsCgwOp, self).init(d_data)

    def get_module_name(self):
        return 'cbs_cgw'

    def get_interface_name(self):
        return ''

class CbsCgwCreateVolumeOp(CCbsCgwOp):
    # create、快照回滚、attach
    def get_interface_name(self):
        return 'qcloud.cbs.CreateCbsForCvm'

    def get_data(self):
        return self._in_data['data']

class CbsCgwAttachVolumeOp(CbsCgwCreateVolumeOp):
    # attach
    def get_interface_name(self):
        return 'qcloud.cbs.AttachCbsForCvm'

if __name__ == '__main__':
    op = CCbsCgwAttachVolumeHandle()
    op.init("hello")
    op.process()

