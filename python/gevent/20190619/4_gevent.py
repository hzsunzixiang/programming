#!/usr/bin/env python3
# -*- coding:UTF-8

from gevent import monkey; monkey.patch_all()
import gevent
import urllib3

#import urllib3
#>>> http = urllib3.PoolManager()
#>>> r = http.request('GET', 'http://httpbin.org/robots.txt')
#>>> r.status

def f(url):
    print('GET: %s' % url)
    http = urllib3.PoolManager()
    respr = http.request('GET', 'url')
    data = resp.read()
    print('%d bytes received from %s.' % (len(data), url))

gevent.joinall([
        gevent.spawn(f, 'https://www.python.org/'),
        gevent.spawn(f, 'https://www.yahoo.com/'),
        gevent.spawn(f, 'https://github.com/'),
])
