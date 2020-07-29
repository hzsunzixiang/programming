#!/usr/bin/python
# -*- coding=UTF-8 -*-

import json
import datetime
dict_a={
	"params": {
		"content": {
			"type": "json",
			"version": "1.0",
			"requestInfo": {
				"requestKey": "mx_201303071053",
				"requestModule": "qcloud",
				"operator": "sng"
			},
			"requestItem": {
				"method": "query_img_task",
				"data": {
					"attr": "query_img_task",
					"taskId": 354
				}
			}
		}
	}
}
print(dict_a)
dict_a["params"]["content"]["requestItem"]["method"]= "xxxxxx"
dict_a["params"]["content"]["requestItem"]["data"]["taskId"]= 352
print(dict_a)
print(json.dumps(dict_a))

