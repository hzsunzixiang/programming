

#sysstat="sadc sar sadf iostat mpstat pidstat nfsiostat-sysstat cifsiostat locales"
sysstat="sar.sysstat sadf iostat mpstat pidstat nfsiostat-sysstat cifsiostat"
procps="free pgrep pkill pmap pwdx tload uptime vmstat w.procps top ps" 
for i in $sysstat $procps iotop perf 
do
	dpkg -S `which $i`
done



#root@debian:~/programming/linux/perf_tool/manual# ls -lh  /usr/bin/sar
#lrwxrwxrwx 1 root root 21 Aug  2  2016 /usr/bin/sar -> /etc/alternatives/sar
#root@debian:~/programming/linux/perf_tool/manual# dpkg -S /etc/alternatives/sar
#dpkg-query: no path found matching pattern /etc/alternatives/sar
#root@debian:~/programming/linux/perf_tool/manual# ll -lh /etc/alternatives/sar
#lrwxrwxrwx 1 root root 20 Aug  2  2016 /etc/alternatives/sar -> /usr/bin/sar.sysstat
#root@debian:~/programming/linux/perf_tool/manual# dpkg -S /usr/bin/sar.sysstat 
#sysstat: /usr/bin/sar.sysstat


#root@debian:~/programming/linux/perf_tool/tools1/sysstat-11.0.1# ls /usr/bin/w
#/usr/bin/w
#root@debian:~/programming/linux/perf_tool/tools1/sysstat-11.0.1# ls /usr/bin/w -lh
#lrwxrwxrwx 1 root root 19 Jul 31  2016 /usr/bin/w -> /etc/alternatives/w
#root@debian:~/programming/linux/perf_tool/tools1/sysstat-11.0.1# ls /etc/alternatives/w -lh
#lrwxrwxrwx 1 root root 17 Jul 31  2016 /etc/alternatives/w -> /usr/bin/w.procps
