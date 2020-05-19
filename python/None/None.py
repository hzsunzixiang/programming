#!/usr/bin/env python
# -*- coding:UTF-8

'''
@author
'''


data={}
class UpdateVmOpResultSucc():
    """更新虚拟机操作结果
    """
    def _process(self):
        #if data.get('owner') in ('1', 1, '0', 0, None):
        #if data.get('owner') ==  None:
        if int(data['owner']) < 1251110:
            print('owner is 1 no need to ' + self.__class__.__name__)
            return


x = UpdateVmOpResultSucc()
x._process()
