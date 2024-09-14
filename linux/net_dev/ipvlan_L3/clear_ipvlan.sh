
#####################
# 从namespace移除
ip netns exec ns5 ip link set ipvl1 netns 1
ip netns exec ns6 ip link set ipvl2 netns 1

# 删除namespace
ip netns delete ns5
ip netns delete ns6


# 删除 ipvl1 ipvl2 
ip link del dev  ipv1 
ip link del dev  ipv2

