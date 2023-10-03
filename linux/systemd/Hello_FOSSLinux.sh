#!/bin/bash

# /etc/systemd/system/FOSSLinux.service

echo "Hello, FOSSLinux!"

## 
mkfifo /tmp/test.sock  

#NOTIFY_SOCKET=/tmp/notify.sock 
systemd-notify --ready --status="Waiting for data …....."

#socat unix-recv:/tmp/test.sock - > /tmp/tmp.txt
#/run/systemd/notify

while : ; do
        echo "...NOTIFY_SOCKET:[ $NOTIFY_SOCKET ]..." > /tmp/notify.txt
        #...NOTIFY_SOCKET:[ /run/systemd/notify]...
        #...NOTIFY_SOCKET:[ /run/systemd/notify.ericksun ]...
        read -r a < /tmp/test.sock # 本进程读取，
        systemd-notify --status="Processing $a"   
 
		# Do something with $a …
		sleep 10
		echo "receive: $a"

        systemd-notify --status="Waiting for data…"
done


#sudo cp Hello_FOSSLinux.sh /usr/local/bin/Hello_FOSSLinux.sh
#sudo cp FOSSLinux.service /etc/systemd/system/FOSSLinux.service
#
#sudo systemctl daemon-reload
#sudo systemctl start FOSSLinux.service 

# create a socket file: nc -vklU /tmp/socket 

# 这样有问题
#ericksun@centos7-mq1:~/programming/linux/systemd (master)$ ls -lh  /run/systemd/notify.ericksun
#srwxr-xr-x. 1 root root 0 Oct  3 09:40 /run/systemd/notify.ericksun





# 这里问题，必须使用 这个notify，改过名字，手工创建的还不行
#ericksun@centos7-mq1:~/programming/linux/systemd (master)$ sudo mv  /run/systemd/notify /run/systemd/notify.ericksun

