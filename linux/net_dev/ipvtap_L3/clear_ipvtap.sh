
#####################
# 从namespace移除
ip netns exec ns5 ip link set ipvtap1 netns 1
ip netns exec ns6 ip link set ipvtap2 netns 1

# 删除namespace
ip netns delete ns5
ip netns delete ns6


# 删除 ipvtap1 ipvtap2 
ip link del dev  ipvtap1 
ip link del dev  ipvtap2

