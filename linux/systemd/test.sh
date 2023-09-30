

#!/bin/sh

if [[ ! -p /tmp/waldo ]]; then
    # commands to execute
    mkfifo /tmp/waldo
fi

systemd-notify --ready --status="Waiting for data…"

while : ; do
        read -r a < /tmp/waldo    # 本进程读取，
        systemd-notify --status="Processing $a"   
 
        # Do something with $a …
		echo "receive: $a"

        systemd-notify --status="Waiting for data…"
done

#ericksun@centos7-mq1:~/programming/linux/systemd (master)$ echo "helloworld" > /tmp/waldo
#ericksun@centos7-mq1:~/programming/linux/systemd (master)$ echo "helloworld" > /tmp/waldo
#ericksun@centos7-mq1:~/programming/linux/systemd (master)$ echo "helloworld" > /tmp/waldo
#ericksun@centos7-mq1:~/programming/linux/systemd (master)$ echo "helloworld" > /tmp/waldo
#如果不加--pid选项，则默认情况下，systemd-notify将使用调用systemd-notify的进程的PID作为服务的主PID。在您的示例中，如果未指定--pid选项，则使用调用systemd-notify的进程的PID作为服务的主PID。

