#!/usr/bin/env python
# -*- coding:UTF-8

'''
Created on 2013-08-09

@author: tangcheng
'''


from BaseHTTPServer import HTTPServer, BaseHTTPRequestHandler
from SocketServer import ThreadingMixIn
import threading
import time

class Handler(BaseHTTPRequestHandler):
 
    def do_GET(self):
        self.__dealRequest()
        return

    def do_POST(self):
        self.__dealRequest()
        return
    def __dealRequest(self):
        self.send_response(200)
        self.end_headers()
        message = threading.currentThread().getName() ## 这里threading就可以自己处理
        self.wfile.write(message)
        self.wfile.write('\n')
        return

def getHttpThreadCount():
    cnt = 0
    allThreads = threading.enumerate() 
    for t in allThreads:
        if hasattr(t, 'name'):
            if t.name[:14] == 'nbs_httpthread':
                cnt = cnt + 1
    return cnt


class NBSThreadingMixIn:
    """Mix-in class to handle each request in a new thread."""

    # Decides how threads will act upon termination of the
    # main process
    daemon_threads = False

    def process_request_thread(self, request, client_address):
        """Same as in BaseServer but as a thread.

        In addition, exception handling is done here.

        """
        try:
            self.finish_request(request, client_address)
            self.shutdown_request(request)
        except:
            self.handle_error(request, client_address)
            self.shutdown_request(request)

    def process_request(self, request, client_address):
        """Start a new thread to process the request."""
        cnt = getHttpThreadCount()
        #线程数超过设置的总数时，等待
        while cnt > 100:
            print "thread pool is full!!!!"
            time.sleep(1)
            cnt = getHttpThreadCount()
        threadName = "nbs_httpthread_%f" % time.time()
        t = threading.Thread(target = self.process_request_thread,
                             args = (request, client_address), name =threadName)
        t.daemon = self.daemon_threads
        t.start()


class ThreadedHTTPServer(NBSThreadingMixIn, HTTPServer):
    """Handle requests in a separate thread."""

if __name__ == '__main__':
    server = ThreadedHTTPServer(('127.0.0.1', 8089), Handler)
    print 'Starting server, use <Ctrl-C> to stop'
    server.serve_forever()



