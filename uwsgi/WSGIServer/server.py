# coding:utf-8

# https://www.programcreek.com/python/example/78007/gevent.pywsgi.WSGIServer 
from gevent.pywsgi import WSGIServer
import gevent.monkey
gevent.monkey.patch_socket()
gevent.monkey.patch_time()
import os
import sys
import json
import time
import uuid
import requests
#import framework.main
#import framework.highlevel
#import framework.prototype.bone
#import framework.prototype.exception
#import business
#import eip_tmp_router
#business.mount()

MAX_BODY = 4000000


def app(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return [b"Hello World, in app"]

if __name__ == '__main__':
    WSGIServer(('', 8520), app).serve_forever()
