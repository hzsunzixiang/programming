pidstat -d -p `ps aux|grep wget |grep -v grep |awk '{print $2}'` 1 > diskio_data.txt  &
pidstat -r -p `ps aux|grep wget |grep -v grep |awk '{print $2}'` 1 > memory_data.txt  & 
pidstat -u -p `ps aux|grep wget |grep -v grep |awk '{print $2}'` 1 > cpu_data.txt     &
pidstat -w -p `ps aux|grep wget |grep -v grep |awk '{print $2}'` 1 > switch_data.txt  &
sudo tcpdump -pnni any port 443  -Uw  network_data_origin.pcap&
