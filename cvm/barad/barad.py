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
    #data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"max","period": 60,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}
    data = {"seqId":"2fa59ef2-828c-4935-2604-4ce26b626e37","caller":"test", "namespace":"qce/host","viewName":"host_cpu","metricName":name1,"statistics":"avg","period": 300,"startTime":b, "endTime":a,"dimensions":[{"lanip": host_ip, 'cpu_name': 'cpu'}]}

#detail:={'send_data': '{"viewName": "host_cpu", "period": 300, "startTime": "2019-07-02 00:00:00", "eventId": 1592388247, "statistics": "max", "dimensions": [{"lanip": "9.29.196.81", "cpu_name": "cpu"}], "caller": "verify", "namespace": "qce/host", "seqId": 1592388247, "endTime": "2019-07-02 21:00:00", "metricName": "logic_cpu_usage"}', 'url': 'metric/statisticsbatch', 'f_decode': <function decode at 0x7f84382e0578>, 'method': 'POST', 'retry': 3}


#detail:={'send_data': '{"viewName": "host_cpu", "period": 300, "startTime": "2019-07-02 00:00:00", "eventId": 1592388247, "statistics": "max", "dimensions": [{"lanip": "9.29.196.81", "cpu_name": "cpu"}], "caller": "verify", "namespace": "qce/host", "seqId": 1592388247, "endTime": "2019-07-02 21:00:00", "metricName": "logic_cpu_usage"}', 'url': 'metric/statisticsbatch', 'f_decode': <function decode at 0x7f84382e0578>, 'method': 'POST', 'retry': 3}
#
#detail = {
#    'send_data': send_data,
#    'f_decode': decode,
#    'url': 'metric/statisticsbatch',
#    'method': 'POST',
#    'retry': 3
#}
    print(data)

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
