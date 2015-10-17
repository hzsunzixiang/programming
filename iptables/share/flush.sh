
iptables -t nat -X LOG_SNAT
iptables -t filter -F 
iptables -t nat    -F 
iptables -t mangle -F 
iptables -t raw    -F 

cat /dev/null > /var/log/iptables_warning.log
cat /dev/null > /var/log/iptables_info.log_
