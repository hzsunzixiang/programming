./start_monitor.sh -d 1 -p `ps aux|grep ChampionTexasServer |grep 15653  |awk '{print $2}'` -P 15653 -f  gameServer
./start_monitor.sh -d 1 -p `ps aux|grep  AccessServer |grep 40843 |grep -v grep |awk '{print $2}'` -P 8310 -f AccessSever 
