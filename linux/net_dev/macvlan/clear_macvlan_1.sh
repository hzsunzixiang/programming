
#####################
# 从namespace移除
ip netns exec ns1 ip link set macvlan1 netns 1
ip netns exec ns2 ip link set macvlan2 netns 1

# 删除namespace
ip netns delete ns1
ip netns delete ns2


# 删除 macvlan1 macvlan2 
ip link del dev  macvlan1 
ip link del dev  macvlan2

#ip link add link ens160 dev macvlan1 type macvlan mode bridge
#ip link add link ens160 dev macvlan2 type macvlan mode bridge
