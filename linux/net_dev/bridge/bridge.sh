# https://superuser.com/questions/764986/howto-setup-a-veth-virtual-network
# 转发和NAT功能
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o brm -j MASQUERADE
iptables -t nat -A POSTROUTING -o ens160 -j MASQUERADE


# 创建一对veth
ip link add dev vm1 type veth peer name vm2
ip link set dev vm1 up
 
# 创建网桥 并加入接口
ip link add brm type bridge
ip link set vm1 master brm

# 对网桥设置IP
ip link set brm up
ip addr add 10.0.0.1/24 dev brm

# 创建namespace
ip netns add nnsm
ip link set vm2 netns nnsm 
 
# 启动lo接口
ip netns exec nnsm  ip link set dev lo up

# 设置ip和网关
ip netns exec nnsm  ip link set dev  vm2 up
ip netns exec nnsm  ip addr add 10.0.0.2/24 dev vm2
ip netns exec nnsm  ip route add default via 10.0.0.1


## 从namespace内部ping
ip netns exec nnsm ping 8.8.8.8
