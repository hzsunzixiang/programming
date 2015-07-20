#!/usr/bin/env python
# -*- coding:UTF-8
#coding=gbk
import httplib
import traceback
import json
import base64
import md5
import os
import urllib



#http://116.228.70.118:9001/zto/api_utf8/commonOrder

headers={}
headers["accept"] = '*/*'  
headers["connection"] = 'Keep-Alive'
headers["Accept-Charset"] =  'UTF-8'
headers["Content-Type"] = 'application/x-www-form-urlencoded'



#    "billCodes": "358758561495",
#wl_info = "358758561495","358758561495",
#wl_info = "358758561495",
wl_info = "778542230628",
#wl_info = "358758561493",
#wl_info = ["358758561493"],  # 这种请求错误 报S04

#wl_info = {
#    "partnerCode": "1124210041",
#}

wl_info_json =json.dumps(wl_info)
print "wl_info_json:", wl_info_json
company_id = "PAIPAIWANG"
key = "lxwsnhPmYlCUnWHIO8CykA=="



#zto_ip = "116.228.70.118"
#zto_ip = "http://japi.zto.cn"
zto_ip = "japi.zto.cn"
#zto_port = 9001
zto_port = 80 
url = "/zto/api_utf8/traceInterface"
msg_type = "TRACES"



def encryptBASE64(data, sign): 
	stringSign = data + sign
	print 'stringSign=', stringSign
	stringUtf8 = stringSign.encode("utf8")
	m = md5.new()
	m.update(stringUtf8)
	#base64Res = base64.b64encode(m.digest())
	base64Res = base64.encodestring(m.digest())
	
	print "len(base64Res)", len(base64Res)
	# 转换为windows下的换行符 
	if os.linesep == '\n':
		print "os.linesep == \\n"
		base64Res = base64Res.replace('\n', '\r\n')		
	print "len(base64Res)", len(base64Res)
	print "base64Res", base64Res
	return base64Res
	

try: 
	data_digest= encryptBASE64(wl_info_json, key) 

	body = urllib.urlencode({'company_id': company_id, 'data_digest': data_digest, 'msg_type': msg_type, 'data': wl_info_json})
	conn = httplib.HTTPConnection(zto_ip, zto_port, timeout = 10)
	
	print "zto_ip:",zto_ip 
	print "body:", body 
	print "header:", headers
	print "url:", url
	conn.request('POST', url, body = body,  headers = headers)
	response = conn.getresponse()
	responseBody = response.read()
	code = response.status
	print "respons:",responseBody
    #print json.dumps(responseBody, indent=4)
	conn.close()
except Exception, e:
	errMesg = traceback.format_exc()
	print errMesg	






#wl_info_json: ["358758561495"]
#stringSign= ["358758561495"]lxwsnhPmYlCUnWHIO8CykA==
#len(base64Res) 25
#os.linesep == \n
#len(base64Res) 26
#base64Res u0uloadOyMAp6EdEynPgGQ==
#
#zto_ip: japi.zto.cn
#body: data=%5B%22358758561495%22%5D&data_digest=u0uloadOyMAp6EdEynPgGQ%3D%3D%0D%0A&company_id=PAIPAIWANG&msg_type=TRACES
#header: {'Accept-Charset': 'UTF-8', 'connection': 'Keep-Alive', 'Content-Type': 'application/x-www-form-urlencoded', 'accept': '*/*'}
#url: /zto/api_utf8/traceInterface
#respons: {"data":[{"billCode":"358758561495","traces":[{"desc":"快件已到达 成都中转 上一站是 成都市场部","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"成都
#市场部","preOrNextSiteCode":"02895","preOrNextSitePhone":"028-68935156,68935159","remark":"","scanDate":"2015-06-10 00:05:02","scanSite":"成都中转","scanSiteCode":"02828","scanSitePhone":"028-62588658","scanType":"到件","signMan":""},{"desc":"快件离开 成都中转 已发往 上海","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"上海","preOrNextSiteCode":"02100","preOrNextSitePhone":"021-39777777","remark":"","scanDate":"2015-06-10 01:20:55","scanSite":"成都中转","scanSiteCode":"02828","scanSitePhone":"028-62588658","scanType":"发件","signMan":""},{"desc":"快件离开 成都中转 已发往 上海","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"上海","preOrNextSiteCode":"02100","preOrNextSitePhone":"021-39777777","remark":"","scanDate":"2015-06-10 01:42:46","scanSite":"成都中转","scanSiteCode":"02828","scanSitePhone":"028-62588658","scanType":"发件","signMan":""},{"desc":"快件已到达 上海 上一
#站是 成都中转","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"成都中转","preOrNextSiteCode":"02828","preOrNextSitePhone":"028-62588658","remark":"","scanDate":"2015-06-11 10:34:11","scanSite":"上海","scanSiteCode":"02100","scanSitePhone":"021-39777777","scanType":"到件","signMan":""},{"desc":"快件已到达 上海 上一站是 上海","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"上海","preOrNextSiteCode":"02100","preOrNextSitePhone":"021-39777777","remark":"","scanDate":"2015-06-11 10:35:58","scanSite":"上海","scanSiteCode":"02100","scanSitePhone":"021-39777777","scanType":"到件","signMan":""},{"desc":"快件离开 上海 已发往 闸北二部","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"闸北二部","preOrNextSiteCode":"02143","preOrNextSitePhone":"021-67637271、67637161","remark":"","scanDate":"2015-06-11 10:53:46","scanSite":"上海","scanSiteCode":"02100","scanSitePhone":"021-39777777","scanType":"发件","signMan":""},{"desc":"闸北二部 的派件已签收，感谢您使用中通快递！","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"","preOrNextSiteCode":"","preOrNextSitePhone":"","remark":"","scanDate":"2015-06-11 11:04:58","scanSite":"闸北二部","scanSiteCode":"02143","scanSitePhone":"021-67637271、67637161","scanType":"签收","signMan":"拍照签收"},{"desc":"快件已到达 闸北二部 上一站是 上海","dispOrRecMan":"","dispOrRecManCode":"","dispOrRecManPhone":"","preOrNextSite":"上海","preOrNextSiteCode":"02100","preOrNextSitePhone":"021-39777777","remark":"","scanDate":"2015-06-11 11:48:40","scanSite":"闸北二部","scanSiteCode":"02143","scanSitePhone":"021-67637271、67637161","scanType":"到件","signMan":""},{"desc":"闸北二部 的 罗金林15801857648 正在派件","dispOrRecMan":"罗金林15801857648","dispOrRecManCode":"02143.072","dispOrRecManPhone":"15801857648","preOrNextSite":"","preOrNextSiteCode":"","preOrNextSitePhone":"","remark":"","scanDate":"2015-06-11 15:16:21","scanSite":"闸北二部","scanSiteCode":"02143","scanSitePhone":"021-67637271、67637161","scanType":"派件","signMan":""}]}],"msg":"","status":true}
#
