
#####################
# 从namespace移除
ip netns exec ns1 ip link set macvtap1 netns 1
ip netns exec ns2 ip link set macvtap2 netns 1

# 删除namespace
ip netns delete ns1
ip netns delete ns2


# 删除 macvtap1 macvtap2 
ip link del dev  macvtap1 
ip link del dev  macvtap2

