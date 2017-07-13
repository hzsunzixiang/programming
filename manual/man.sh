#sysstat="sadc sar sadf iostat mpstat pidstat nfsiostat-sysstat cifsiostat locales"
sysstat="sar iostat mpstat pidstat nfsiostat cifsiostat"
procps="free pgrep pkill pmap pwdx tload uptime vmstat w ps"
for i in $sysstat $procps iotop perf
do	
	man $i | col -b > $i.man
done

