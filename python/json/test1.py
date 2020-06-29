#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json
import datetime

# 下面两种 形式均 ok
y={u'Response': {u'RequestId': u'a4910beb-946e-4417-8382-5a4df5bc33f9', u'TaskSet': [{u'ErrorMessage': u'', u'TaskId': u'647917'}]}}
y= {u'Response': {u'RequestId': u'6242597f-3592-4cad-8662-91688abbce9f', u'Error': {u'Message': u'Fail dealing with tenant resource. message is The parameter `Postfix` is not recognized. (6242597f)', u'Code': u'FailedOperation.TenantFailedOperation'}}} 
print(json.dumps(y))
