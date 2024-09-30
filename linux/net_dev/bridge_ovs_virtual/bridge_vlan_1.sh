# 转发相关的
# https://docs.openvswitch.org/en/latest/howto/vlan/

# 创建 2对 veth挂接到 vlan102
ip link add dev vm101 type veth peer name vm102
ip link add dev vm111 type veth peer name vm112
ip link set dev vm101 up
ip link set dev vm111 up

# 创建 1对 veth挂接到 vlan103
ip link add dev vm103 type veth peer name vm104
ip link set dev vm103 up

# 创建网桥br0  并加入接口
# openvswitch的网桥能够同时容纳多个vlan
ovs-vsctl add-br br0
ip link set br0 up

# 创建一个虚拟接口，放入网桥
ip link add link ens160 name ens160.2 type vlan id 102
ip link set ens160.2 up

ip link add link ens160 name ens160.3 type vlan id 103
ip link set ens160.3 up

# br0 
ovs-vsctl add-port br0 ens160.2
ovs-vsctl add-port br0 ens160.3

#  加入vlan tag 为102的接口
ovs-vsctl add-port br0 vm101  tag=102
ovs-vsctl add-port br0 vm111  tag=102

#  加入vlan tag 为103的接口
ovs-vsctl add-port br0 vm103  tag=103

# 创建namespace
sudo ip netns add ns11
sudo ip netns add ns12
sudo ip netns add ns21 

# 加入到namespace
ip link set vm102 netns ns11 
ip link set vm112 netns ns12
ip link set vm104 netns ns21

# 启动
ip netns exec ns11  ip link set dev vm102 up
ip netns exec ns12  ip link set dev vm112 up
ip netns exec ns21  ip link set dev vm104 up

# 设置ip 
ip netns exec ns11 ip addr add 10.0.2.2/24 dev vm102
ip netns exec ns12 ip addr add 10.0.2.3/24 dev vm112
ip netns exec ns21 ip addr add 10.0.3.2/24 dev vm104

## 从namespace内部ping
#ip netns exec ns11 ping 10.0.2.3
