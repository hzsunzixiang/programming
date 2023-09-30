#!/bin/bash

# /etc/systemd/system/FOSSLinux.service

echo "Hello, FOSSLinux!"
#!/bin/sh

#if [[ ! -p /tmp/test.sock]]; then
#    # commands to execute
#    mkfifo /tmp/test.sock
#fi
mkfifo /tmp/test.sock

NOTIFY_SOCKET=/tmp/test.sock systemd-notify --ready --status="Waiting for data…"

#socat unix-recv:/tmp/test.sock - > /tmp/tmp.txt

while : ; do
        read -r a < /tmp/test.sock # 本进程读取，
        systemd-notify --status="Processing $a"   
 
        # Do something with $a …
		# Do something with $a …
		sleep 10
		echo "receive: $a"

        systemd-notify --status="Waiting for data…"
done
