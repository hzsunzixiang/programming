iptables -A OUTPUT --protocol tcp --tcp-flags ALL SYN,ACK --sport 8888  -j DROP
iptables-save
sleep 10

iptables -F
iptables-save

