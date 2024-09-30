# 转发相关的
# https://docs.openvswitch.org/en/latest/howto/vlan/

# 创建 1对 veth挂接到 vlan102
ip link add dev vm101 type veth peer name vm102
ip link set dev vm101 up

# 创建 2对 veth挂接到 vlan103
ip link add dev vm103 type veth peer name vm104
ip link add dev vm113 type veth peer name vm114
ip link set dev vm103 up
ip link set dev vm113 up

# 创建网桥br0  并加入接口
# openvswitch的网桥能够同时容纳多个vlan
ovs-vsctl add-br br0
ip link set br0 up

#  加入vlan tag 为102的接口
ovs-vsctl add-port br0 vm101  tag=102

#  加入vlan tag 为103的接口
ovs-vsctl add-port br0 vm103  tag=103
ovs-vsctl add-port br0 vm113  tag=103

# 网桥br0不用配置IP

# 创建namespace
sudo ip netns add ns11
sudo ip netns add ns21 
sudo ip netns add ns22 

# 加入到namespace
ip link set vm102 netns ns11 
ip link set vm104 netns ns21
ip link set vm114 netns ns22

# 启动
ip netns exec ns11  ip link set dev lo up
ip netns exec ns21  ip link set dev lo up
ip netns exec ns22  ip link set dev lo up

ip netns exec ns11  ip link set dev vm102 up
ip netns exec ns21  ip link set dev vm104 up
ip netns exec ns22  ip link set dev vm114 up

# 设置ip 
ip netns exec ns11 ip addr add 10.0.2.5/24 dev vm102
ip netns exec ns21 ip addr add 10.0.3.4/24 dev vm104
ip netns exec ns22 ip addr add 10.0.3.5/24 dev vm114

## 从namespace内部ping
#ip netns exec ns21 ping 10.0.3.5
