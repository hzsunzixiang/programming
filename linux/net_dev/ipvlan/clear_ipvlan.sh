
#####################
# 从namespace移除
ip netns exec ns0 ip link set ipvl0 netns 1
ip netns exec ns1 ip link set ipvl1 netns 1

# 删除namespace
ip netns delete ns0
ip netns delete ns1


# 删除 ipvl1 ipvl2 
ip link del dev  ipvl0 
ip link del dev  ipvl1

