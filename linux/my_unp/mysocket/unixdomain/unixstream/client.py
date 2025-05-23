# -*- coding: utf-8 -*-
import socket
import os
import time

print("Connecting...")
if os.path.exists("/tmp/python_unix_sockets_example"):
    client = socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM)
    client.connect("/tmp/python_unix_sockets_example")
    print("Ready.")
    print("Ctrl-C to quit.")
    print("Sending 'DONE' shuts down the server and quits.")
    while True:
        try:
            x = "hello,world"
            print("SEND:", x)
            client.send(x.encode('utf-8'))
            time.sleep(2)
            if "DONE" == x:
                print("Shutting down.")
                break
        except KeyboardInterrupt as k:
            print("Shutting down.")
            client.close()
            break
else:
    print("Couldn't Connect!")
    print("Done")
