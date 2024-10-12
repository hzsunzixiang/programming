


https://docs.openvswitch.org/en/latest/howto/vlan/


用物理接口做实验



## 这样抓不到 vlan报文
sudo tcpdump -pnni any -w tcpdump/ovs_vlan.pcap
sudo tcpdump -pnni any  -XXX -w tcpdump/ovs_vlan_2.pcap


## 这样反倒可以
sudo tcpdump -pnni ens256 -XXX -w tcpdump/ovs_vlan_interface.pcap
sudo tcpdump -pnni ens256  icmp -XXX -Uw tcpdump/ovs_vlan_ens256.pcap
