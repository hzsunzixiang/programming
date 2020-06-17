import datetime

region="gz"
uuids=["fffe31fc-4f2c-475d-ab2c-19557da776be","fffdfd4c-8a21-45f7-8714-c56562abb5ae","fffcdd20-7555-41c6-a9ec-06f72c582cb9"]

def get_cpu(region,uuids):
    #a=timedelta(minutes=-399)
    #b = datetime.datetime.now()-datetime.timedelta(days=1)
    #b = datetime.datetime.now()-datetime.timedelta(seconds=300)
    b = datetime.datetime.now()-datetime.timedelta(seconds=60)
    a = datetime.datetime.now()


    a,b = (a.isoformat(' '),b.isoformat(' '))
    a,b =a[:19],b[:19]
    #name1="qemu_vcpu_usage"
    name1="logic_cpu_usage"
    host_ip = "10.22.1.144"
    #data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/cvm","viewName":"cvm_device","metricName":name1,"statistics":"avg","period":3600,"startTime":b, "endTime":a,"dimensions":[{"vm_uuid":uuid} for uuid in uuids]}
    #data = {"caller":"test", "namespace":"qce/host","viewName":"cvm_device","metricName":name1,"statistics":"avg","period":3600,"startTime":b, "endTime":a,"dimensions":[{"vm_uuid":uuid} for uuid in uuids]}
    #data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"avg","period": 300,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}
    #data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"avg","period": 60,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}
    #data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"avg","period": 84600,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}
    #data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"avg","period": 3600,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}
    #data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"avg","period": 300,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}
    data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"max","period": 300,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}
    data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"max","period": 60,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}

    print(data)

#391             'namespace': 'qce/host',
#392             'viewName': 'host_node',
#393             'metricName': 'node_usage',
#394             'statistics': statistics,
#395             'period': period,
#396             'startTime': start_time.strftime('%Y-%m-%d %H:%M:%S'),
#397             'endTime': end_time.strftime('%Y-%m-%d %H:%M:%S'),
#398             'dimensions': [{
#399                 'lanip': host_ip,
#400                 'nodeid': 'node0'
#401             }, {
#402                 'lanip': host_ip,
#403                 'nodeid': 'node1'
#404             }]

    import requests
    import json
    a = requests.post("http://baradApi.tcloud-barad-api.chongqing.hw.tce-arm.fsphere.cn/metric/statisticsbatch",json.dumps(data)).json()
    print (json.dumps(a))
    #return ([average(filter(lambda x:x,i)) for i in a["data"]["points"]])


def average(seq):
    seq=list(seq)
    if not seq:
        return -1 
    return seq
    return float(sum(seq)) / len(seq)


print (get_cpu(region,uuids))
