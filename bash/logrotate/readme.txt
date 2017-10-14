https://www.techwalla.com/articles/how-to-unzip-a-gz-file-in-linux

解压压缩之后的文件
gunzip test.log.1.gz

# 压缩和解压缩
gzip test.log.1 
gunzip test.log.1.gz 


StephenSun@debian-1:~/programming/bash/logrotate$ cat /etc/cron.daily/logrotate 
#!/bin/sh

test -x /usr/sbin/logrotate || exit 0
/usr/sbin/logrotate /etc/logrotate.conf
/usr/sbin/logrotate /etc/logrotate.d/test.conf
