
#####################
# 从namespace移除
ip netns exec ns11 ip link set vm102 netns 1
ip netns exec ns21 ip link set vm104 netns 1
ip netns exec ns22 ip link set vm114 netns 1

# 删除namespace
ip netns delete ns11
ip netns delete ns21 
ip netns delete ns22

# 删除  1对 veth挂接到 vlan102
ip link delete vm101

# 删除 2对 veth挂接到 vlan103
ip link delete vm103
ip link delete vm113

# 删除子接口
ip link delete link ens160 name ens160.2 type vlan id 102
ip link delete link ens160 name ens160.3 type vlan id 103

# 删除网桥br0 
ovs-vsctl del-br br0
