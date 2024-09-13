# 转发相关的
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o brm -j MASQUERADE
iptables -t nat -A POSTROUTING -o ens160 -j MASQUERADE

# 创建 vlan102 vlan103
ip link add link ens160 name ens160.2 type vlan id 102
ip link add link ens160 name ens160.3 type vlan id 103

# 创建 2对 veth挂接到 vlan102
ip link add dev vm101 type veth peer name vm102
ip link add dev vm111 type veth peer name vm112
ip link set dev vm101 up
ip link set dev vm111 up

# 创建 1对 veth挂接到 vlan103
ip link add dev vm103 type veth peer name vm104
ip link set dev vm103 up

# 创建网桥br102 并加入接口
ip link add br102 type bridge
ip link set ens160.2 master br102
ip link set vm101 master br102
ip link set vm111 master br102

# 创建网桥br103 并加入接口
ip link add br103 type bridge
ip link set ens160.3 master br103
ip link set vm103 master br103

# 配置网桥br102的IP
ip link set br102 up
ip addr add 10.0.2.1/24 dev br102

# 配置网桥br103的IP
ip link set br103 up
ip addr add 10.0.3.1/24 dev br103

# 创建namespace
sudo ip netns add ns11
sudo ip netns add ns12
sudo ip netns add ns21 

# 加入到namespace
ip link set vm102 netns ns11 
ip link set vm112 netns ns12
ip link set vm104 netns ns21

# 启动
ip netns exec ns11  ip link set dev lo up
ip netns exec ns12  ip link set dev lo up
ip netns exec ns21  ip link set dev lo up

ip netns exec ns11  ip link set dev vm102 up
ip netns exec ns12  ip link set dev vm112 up
ip netns exec ns21  ip link set dev vm104 up

# 设置ip 
ip netns exec ns11 ip addr add 10.0.2.2/24 dev vm102
ip netns exec ns12 ip addr add 10.0.2.3/24 dev vm112
ip netns exec ns21 ip addr add 10.0.3.2/24 dev vm104

# 设置网关
ip netns exec ns11 ip route add default via 10.0.2.1
ip netns exec ns12 ip route add default via 10.0.3.1
ip netns exec ns21 ip route add default via 10.0.1.1

## 从namespace内部ping
ip netns exec ns11 ping 10.0.2.3
