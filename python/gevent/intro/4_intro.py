#!/usr/bin/env python3
# -*- coding:UTF-8



#import gevent
#from gevent import socket
#
##urls = ['www.google.com', 'www.example.com', 'www.python.org']
#urls = ['www.google.com', 'www.example.com', 'www.python.org', 'notexsit']
#jobs = [gevent.spawn(socket.gethostbyname, url) for url in urls]
#
##gevent.joinall(jobs, timeout=2)
#gevent.joinall(jobs, timeout=10)
#result = [job.value for job in jobs]
#print(result)
##['74.125.79.106', '208.77.188.166', '82.94.164.162']

from gevent import monkey; monkey.patch_socket()
import gevent
import socket
 
urls = ['www.baidu.com', 'www.gevent.org', 'www.python.org']
jobs = [gevent.spawn(socket.gethostbyname, url) for url in urls]
gevent.joinall(jobs, timeout=5)
	 
print([job.value for job in jobs])


