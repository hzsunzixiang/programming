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

import hashlib

#http://180.166.232.222:9001/zto/api_utf8/commonOrder

headers={}
headers["accept"] = '*/*'  
headers["connection"] = 'Keep-Alive'
headers["Accept-Charset"] =  'UTF-8'
headers["Content-Type"] = 'application/x-www-form-urlencoded'



#wl_info = {
#    "partnerCode": "1124210041",
#    "type": "",
#    "tradeId": "795019790-20150611-1369105696",
#    "mailNo": "1000000000016",
#  	"sender": {
#    "id": "130520142010",
#    "name": "李琳",
#    "company": "新南电子商务有限公司",
#    "mobile": "13912345678",
#    "phone": "021-87654321",
#    "prov": "上海市",
#    "city": "上海市",
#    "county": "青浦区",
#    "address": "华新镇华志路123号",
#    "zipcode": "610012"
#    },
#}

#wl_info = {"items":[{"name":"rose_cod_test","quantity":1,"unitprice":1210}],"orderSum":2200,"partnerCode":"71020","price":0,"receiver":{"address":"etst","area":"北京","city":"北京市","county":"通州区","mobile":"12453698745","name":"uuu","phone":"","zipcode":"111111"},"sender":{"address":"85号","area":"广东","city":"深圳市","county":"南山区","id":795019790,"mobile":"13510618371","name":"张山","phone":"010-888888888","zipcode":"518000"},"tradeId":"2201195901201506300606146922","type":"1"}

#http://116.228.70.118:9001/zto/api_utf8/commonOrder
#wl_info = {"items":[{"name":"rose_cod_test","quantity":1,"unitprice":1210}],"orderSum":2200,"partnerCode":"71034","price":0,"receiver":{"address":"etst","area":"北京","city":"北京市","county":"通州区","mobile":"12453698745","name":"uuu","phone":"","zipcode":"111111"},"sender":{"address":"85号","area":"广东","city":"深圳市","county":"南山区","id":795019790,"mobile":"13510618371","name":"张山","phone":"010-888888888","zipcode":"518000"},"tradeId":"2201195901201507010606146957","type":"1"}

#wl_info =  {"type":"南山"}
#wl_info =  {2:"一"}
wl_info = {"items":[{"name":"rose_cod_test","quantity":1,"unitprice":1210}],"orderSum":2200,"partnerCode":"71058","price":0,"receiver":{"address":"etst","area":"北京","city":"北京市","county":"通州区","mobile":"12453698745","name":"uuu","phone":"","zipcode":"111111"},"sender":{"address":"85号","area":"广东","city":"深圳市","county":"南山区","id":795019790,"mobile":"13510618371","name":"张山","phone":"010-888888888","zipcode":"518000"},"tradeId":"2201195901201507010606146982","type":"1"}  
wl_info_json =json.dumps(wl_info)
company_id = "PAIPAIWANG"
key = "lxwsnhPmYlCUnWHIO8CykA=="



zto_ip = "116.228.70.118"
zto_port = 9001
url = "/zto/api_utf8/commonOrder"
msg_type = "CREATE"


def encryptBASE64(data, sign): 
	stringSign = data + sign
	print 'stringSign=', stringSign
	stringUtf8 = stringSign.encode("utf8")
	#myMd5 = hashlib.md5()
	#myMd5.update(stringUtf8)
	#md5_digest = myMd5.hexdigest()
	##print "md5sum:", str(m.digest())
	#print "md5sum:", str(md5_digest)
	#base64Res = base64.encodestring(md5_digest)
	#print "len(base64Res)", len(base64Res)
	#print "base64Res", base64Res

	print "###################3"
	m = md5.new()
	m.update(stringUtf8)
	#base64Res = base64.b64encode(m.digest())
	print "------------"
	m.digest()
	print "------------"
	base64Res = base64.encodestring(m.digest())
	
	print "len(base64Res)", len(base64Res)
	# 转换为windows下的换行符 
	if os.linesep == '\n':
		print "os.linesep == \\n"
		#base64Res = base64Res.replace('\n', '\r\n')		
		base64Res = base64Res.replace('\n', '')		
	print "len(base64Res)", len(base64Res)
	print "base64Res", base64Res
	return base64Res
	

try: 
	data_digest= encryptBASE64(wl_info_json, key) 

	body = urllib.urlencode({'company_id': company_id, 'data_digest': data_digest, 'msg_type': msg_type, 'data': wl_info_json})
	conn = httplib.HTTPConnection(zto_ip, zto_port, timeout = 10)
	print "body:", body 
	print "header:", headers
	print "url:", url
	conn.request('POST', url, body = body,  headers = headers)
	response = conn.getresponse()
	responseBody = response.read()
	code = response.status
	print "respons:",responseBody
	conn.close()
except Exception, e:
	errMesg = traceback.format_exc()
	print errMesg	


#1. 签名错误直接返回
#
#   S01	非法的JSON格式
#   S02	非法的数字签名
#   S03	非法的物流公司
#   S04	非法的通知类型
#   S05	非法的通知内容
#   S07	系统异常,请重试
#   S08	非法的电商平台
#   
#
#2. 报错时返回为 false
#{"orderCode":null,"reason":"寄件省市区为空","result":false}
#
#3. 正确时返回true
#{"orderCode":"ZT15061900043346","reason":null,"result":true}
#
