@echo off
echo -----------------------------------------nslookup----------------------------------------- >> net.log
nslookup texas.17c.cn >> net.log

echo ----------------------------------------Start Ping---------------------------------------- >> net.log
ping -n 5 texas.17c.cn >> net.log
ping -n 5 120.132.184.42 >> net.log
ping -n 5 58.83.143.34 >> net.log
ping -n 5 120.132.184.35 >> net.log
echo ------------------------------------------------------------------------------------------ >> net.log


echo --------------------Start Tracert----------------------- >> net.log
tracert -d texas.17c.cn >> net.log
echo --------------------End Tracert------------------------- >> net.log