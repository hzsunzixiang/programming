
#####################
# 从namespace移除
ip netns exec ns0 ip link set ipvtap0 netns 1
ip netns exec ns1 ip link set ipvtap1 netns 1

# 删除namespace
ip netns delete ns0
ip netns delete ns1


# 删除 ipvtap1 ipvtap2 
ip link del dev  ipvtap0 
ip link del dev  ipvtap1

