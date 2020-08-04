#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json
import datetime

x = {'version': 1, 'caller': 'postman', 'componentName': 'MC', 'eventId': 1595474820, 'interface': {'interfaceName': 'message.message.sendMsg4Subscribe', 'para': {'ownerUin': '100004603007', 'themeId': 1249, 'tplParams': {'siteTpl': ['100004603007', 't1@test.com', 1, 0, 1, '', '', '', ''], 'emailTpl': ['100004603007', 't1@test.com', 1, 0, 1, '', '', '', ''], 'smsTpl': ['100004603007', 't1@test.com', 1, 0, 1, ''], 'wechatTpl': ['100004603007', 't1@test.com', '', 0, 1, 'ubuntu', '']}}}}
print(x)
print(json.dumps(x))
