#!/usr/bin/env python
# -*- coding:UTF-8



# coding:utf-8

import time
import json
from base import BaseAdapter


class MarketAdapter(BaseAdapter):
    getImageProductsDetail = lambda: ""
    getImagesDetail = lambda: ""
    #rewrite = {
    #    'setImageAuditResult': 'qcloud.Image.setImageAuditResult',
    #    'getByConds': 'qcloud.Image.getByConds',
    #}
    
    def _unpack(self, data):
        """
        对返回的数据数据进行反序列化过程
        """
        _ = json.loads(data)
        assert _[
            'code'] == 0, '%s return non-zero(%d),and reason is "%s"' % (
                self.component_name, _['code'], _['msg'])

        if 'returnData' in _:
            return _['returnData']
        else:
            return _['data']

    @property
    def component_name(self):
        return 'market'


if __name__=='__main__':
    market = MarketAdapter()
    #market.getImagesDetail(1,2,3, abc="hello")
