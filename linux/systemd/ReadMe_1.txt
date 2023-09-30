
To learn the message format sd_notify, you can try this:

terminal 1:

$ socat unix-recv:/tmp/test.sock -
terminal 2:

$ NOTIFY_SOCKET=/tmp/test.sock systemd-notify --ready --status="hello"
You will see result in terminal 1:

READY=1
STATUS=hello



ericksun@centos7-mq1:~/programming/linux/systemd (master)$ systemctl status FOSSLinux.service
● FOSSLinux.service - FOSSLinux Service
   Loaded: loaded (/etc/systemd/system/FOSSLinux.service; disabled; vendor preset: disabled)
   Active: activating (start) since Sat 2023-09-30 12:32:33 EDT; 18s ago
 Main PID: 126187 (Hello_FOSSLinux)
   Status: "Waiting for data…"
    Tasks: 1
   CGroup: /system.slice/FOSSLinux.service
           └─126187 /bin/bash /usr/local/bin/Hello_FOSSLinux.sh
ericksun@centos7-mq1:~/programming/linux/systemd (master)$ systemctl status FOSSLinux.service
● FOSSLinux.service - FOSSLinux Service
   Loaded: loaded (/etc/systemd/system/FOSSLinux.service; disabled; vendor preset: disabled)
   Active: activating (start) since Sat 2023-09-30 12:32:33 EDT; 18s ago
 Main PID: 126187 (Hello_FOSSLinux)
   Status: "Waiting for data…"
    Tasks: 1
   CGroup: /system.slice/FOSSLinux.service
           └─126187 /bin/bash /usr/local/bin/Hello_FOSSLinux.sh
ericksun@centos7-mq1:~/programming/linux/systemd (master)$ systemctl status FOSSLinux.service
● FOSSLinux.service - FOSSLinux Service
   Loaded: loaded (/etc/systemd/system/FOSSLinux.service; disabled; vendor preset: disabled)
   Active: activating (start) since Sat 2023-09-30 12:32:33 EDT; 19s ago
 Main PID: 126187 (Hello_FOSSLinux)
   Status: "Waiting for data…"
    Tasks: 1
   CGroup: /system.slice/FOSSLinux.service
           └─126187 /bin/bash /usr/local/bin/Hello_FOSSLinux.sh
ericksun@centos7-mq1:~/programming/linux/systemd (master)$ echo hello > /tmp/test.sock
ericksun@centos7-mq1:~/programming/linux/systemd (master)$ systemctl status FOSSLinux.service
● FOSSLinux.service - FOSSLinux Service
   Loaded: loaded (/etc/systemd/system/FOSSLinux.service; disabled; vendor preset: disabled)
   Active: activating (start) since Sat 2023-09-30 12:32:33 EDT; 23s ago
 Main PID: 126187 (Hello_FOSSLinux)
   Status: "Processing hello"
    Tasks: 2
   CGroup: /system.slice/FOSSLinux.service
           ├─126187 /bin/bash /usr/local/bin/Hello_FOSSLinux.sh
           └─126268 sleep 10

