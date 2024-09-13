
#####################
# 从namespace移除
ip netns exec ns11 ip link set macvlan11 netns 1
ip netns exec ns12 ip link set macvlan12 netns 1
ip netns exec ns21 ip link set macvlan21 netns 1

# 删除namespace
ip netns delete ns11
ip netns delete ns12
ip netns delete ns21


# 删除 macvlan11 macvlan12 macvlan21
ip link del dev  macvlan11 
ip link del dev  macvlan12
ip link del dev  macvlan21

# 删除vlan
ip link del dev  ens160.10 type vlan 
ip link del dev  ens160.20 type vlan

#ip link add link ens160 dev macvlan1 type macvlan mode bridge
#ip link add link ens160 dev macvlan2 type macvlan mode bridge
