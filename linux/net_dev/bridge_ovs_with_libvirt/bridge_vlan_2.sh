# 转发相关的
# https://docs.openvswitch.org/en/latest/howto/vlan/


# 本端用虚拟机配置

ovs-vsctl add-br OVS0
ovs-vsctl add-port OVS0 ens256
virsh net-define   OVS0.xml
virsh net-autostart --network OVS0
virsh net-start  OVS0
virsh net-list


