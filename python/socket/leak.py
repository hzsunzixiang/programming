import socket
import os
import sys
import time

PORT = 9918

sd = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sd.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sd.bind(('0.0.0.0', PORT))
sd.listen(5)

for i in range(10):
    if os.fork() == 0:
        sd.close()
        cd = socket.socket(socket.AF_INET,
                           socket.SOCK_STREAM)
        cd.connect(('127.0.0.1', PORT))
        sys.exit()

print("Server process pid=%i" % (os.getpid(),))
sockets = []
for i in range(10):
    (cd, address) = sd.accept()
    sockets.append(cd)
    cd.shutdown(socket.SHUT_WR)

os.system("lsof -p %i" % (os.getpid(),))
#os.system("netstat -nt|grep :%i" % (PORT,))
time.sleep(10000)

# http://mdba.cn/2015/03/10/tcp-socket%E6%96%87%E4%BB%B6%E5%8F%A5%E6%9F%84%E6%B3%84%E6%BC%8F/
# https://idea.popcount.org/2012-12-09-lsof-cant-identify-protocol/
