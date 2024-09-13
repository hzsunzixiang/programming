
# 转发相关的
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o brm -j MASQUERADE
iptables -t nat -A POSTROUTING -o ens160 -j MASQUERADE

# 创建 vlan100 vlan200
ip link add link ens160 name ens160.1 type vlan id 100
ip link add link ens160 name ens160.2 type vlan id 200

# 创建 2对 veth挂接到 vlan100
ip link add dev vm101 type veth peer name vm102
ip link add dev vm111 type veth peer name vm112
ip link set dev vm101 up
ip link set dev vm111 up

# 创建 2对 veth挂接到 vlan200
ip link add dev vm103 type veth peer name vm104
ip link add dev vm113 type veth peer name vm114
ip link set dev vm103 up
ip link set dev vm113 up

# 创建加入网桥brm1
ip link add brm1 type bridge
ip link set vm101 master brm1
ip link set vm111 master brm1

# 创建加入网桥
ip link add brm2 type bridge
ip link set vm103 master brm2
ip link set vm113 master brm2

# 配置网桥brm1的IP
ip link set brm1 up
ip addr add 10.0.0.1/24 dev brm1

# 配置网桥brm2的IP
ip link set brm2 up
ip addr add 10.0.1.1/24 dev brm2

# 创建namespace
sudo ip netns add ns11
sudo ip netns add ns12
sudo ip netns add ns21 
sudo ip netns add ns22

# 加入到namespace
ip link set vm102 netns ns11 
ip link set vm112 netns ns12
ip link set vm104 netns ns21
ip link set vm114 netns ns22
# 启动
ip netns exec ns11  ip link set dev lo up
ip netns exec ns12  ip link set dev lo up
ip netns exec ns21  ip link set dev lo up
ip netns exec ns22  ip link set dev lo up

ip netns exec ns11  ip link set dev vm102 up
ip netns exec ns12  ip link set dev vm112 up
ip netns exec ns21  ip link set dev vm104 up
ip netns exec ns22  ip link set dev vm114 up

# 设置ip 
ip netns exec ns11 ip addr add 10.0.0.2/24 dev vm102
ip netns exec ns12 ip addr add 10.0.0.3/24 dev vm112
ip netns exec ns21 ip addr add 10.0.1.2/24 dev vm104
ip netns exec ns22 ip addr add 10.0.1.3/24 dev vm114
# 设置网关
ip netns exec ns11 ip route add default via 10.0.0.1
ip netns exec ns12 ip route add default via 10.0.0.1
ip netns exec ns21 ip route add default via 10.0.1.1
ip netns exec ns22 ip route add default via 10.0.1.1

## 从namespace内部ping
ip netns exec ns11 ping 10.0.0.1
