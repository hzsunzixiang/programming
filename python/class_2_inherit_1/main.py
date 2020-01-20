#!/usr/local/services/python/bin/python
# -*- coding: utf-8 -*-

import json
import copy

#   CCbsCgwAttachVolumeHandle.process 
#   CBaseOp.process    只有基类中有定义      process 
#   CCbsCgwVolumeHandle.do_process
#   get_cbs_op (CCbsCgwAttachVolumeHandle)     CCbsCgwVolumeHandle调用，定义在 CCbsCgwAttachVolumeHandle  返回 CbsCgwAttachVolumeOp

#   CbsCgwAttachVolumeOp.process  开始调用    
#   最终调用基类的 CBaseOp.process  调用 do_process
#   CHttpOp.do_process    

# 基类
class CBaseOp(object):
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
        reply = op.process()

    def do_process(self):
        print("in CCbsCgwVolumeHandle do_process")
        item = None
        ret = self.do_op_cbs(item)

class CCbsCgwAttachVolumeHandle(CCbsCgwVolumeHandle):
    def get_cbs_op(self):
        # cbs-oss老接口，CCbsAttachDiskOp内部包含'ha_attach'字段，cbs-cgw无需此字段
        print("in CCbsCgwAttachVolumeHandle get_cbs_op")
        return CbsCgwAttachVolumeOp()

####### Op 相关
class CHttpOp(CBaseOp):

    def do_process(self):
        print("in CHttpOp do_process module_name:%s, interface_name:%s"%(self.get_module_name(), self.get_interface_name()))

    def get_module_name(self):
        return ''

class CCbsCgwOp(CHttpOp):

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
    op.process()

# in CBaseOp process
# in CCbsCgwVolumeHandle do_process
# in CCbsCgwVolumeHandle do_op_cbs
# in CCbsCgwAttachVolumeHandle get_cbs_op
# in CBaseOp process
# in CHttpOp do_process module_name:cbs_cgw, interface_name:qcloud.cbs.AttachCbsForCvm

