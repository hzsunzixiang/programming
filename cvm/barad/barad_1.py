#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import time
import requests
import datetime


class BaradDataAccess():
    def _get_module(self):
        return 'BARAD'

    def _post_pack(self, para):
        para['caller'] = 'verify'
        para['seqId'] = int(time.time())
        para['eventId'] = int(time.time())
        return json.dumps(para)

    def _pack(self, para):
        def _url_builder(src, result, prefix_key=""):
            if isinstance(src, dict):
                for k, v in src.items():
                    key = k if prefix_key == "" else "%s[%s]" % (prefix_key, k)
                    value = _url_builder(v, result, key)
                    if value != None:
                        result.append("%s=%s" % (key, value))
                        # result.append("%s=%s" % (quote(key), value))
            elif isinstance(src, list):
                for i in range(len(src)):
                    key = "%s[%s]" % (prefix_key, i)
                    value = _url_builder(src[i], result, key)
                    if value != None:
                        result.append("%s=%s" % (key, value))
                        # result.append("%s=%s" % (quote(key), value))
            else:
                return src

        protocol = []
        para["caller"] = "verify"
        para["eventId"] = int(time.time())
        print "eventId", para["eventId"]
        _url_builder(para, protocol)
        return "&".join(protocol)

    def _unpack(self, ret):
        # print ret
        ret = json.loads(ret)
        code = 0
        msg = ""
        data = ret
        return data

    def batch_query_host_logic_cpu_usage(self, url, host_ip_list, start_time, end_time, statistics='max', period=300):
        para = {
            'namespace': 'qce/host',
            'viewName': 'host_cpu',
            'metricName': 'logic_cpu_usage',
            'statistics': statistics,
            'period': period,
            'startTime': start_time.strftime('%Y-%m-%d %H:%M:%S'),
            'endTime': end_time.strftime('%Y-%m-%d %H:%M:%S'),
            'dimensions': [{'lanip': host_ip, 'cpu_name': 'cpu'} for host_ip in host_ip_list]
        }
        send_data = self._post_pack(para)

        def decode(ret):
            ret = self._unpack(ret)
            return ret

        print ("send_data", send_data)
        a = requests.post(url, send_data).json()
        print (json.dumps(a))



if __name__ == '__main__':
    # from datetime import datetime
    vm_list = ['0000038e-f44f-409e-8e1e-e7ba34af170d']
    start_time = datetime.datetime(2020, 6, 17, 18, 0, 0)
    end_time = datetime.datetime(2020, 6, 17, 18, 0, 5)
    obj = BaradDataAccess()
    # datas = obj.batch_query_vm_qemu_cpu_usage(vm_list, start_time, end_time)
    datas = obj.batch_query_host_logic_cpu_usage("http://baradApi.tcloud-barad-api.chongqing.hw.tce-arm.fsphere.cn/metric/statisticsbatch", ['10.22.1.144'], start_time, end_time)
    print(datas)

