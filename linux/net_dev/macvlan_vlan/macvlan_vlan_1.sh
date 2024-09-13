ip link set ens160 promisc on

# 创建 vlan10 vlan20
ip link add link ens160 name ens160.10 type vlan id 10
ip link add link ens160 name ens160.20 type vlan id 20

# 在此vlan基础上 创建 macvlan
ip link add link ens160.10 dev macvlan11 type macvlan mode bridge
ip link add link ens160.10 dev macvlan12 type macvlan mode bridge
ip link add link ens160.20 dev macvlan21 type macvlan mode bridge

# 创建对应的命名空间
ip netns add ns11
ip netns add ns12
ip netns add ns21
ip netns list

# 放入对应的命名空间
ip link set dev macvlan11  netns ns11
ip link set dev macvlan12  netns ns12
ip link set dev macvlan21  netns ns21

# 此时没有dhcp，对ns1 配置 IP 
ip netns exec ns11 ip link set macvlan11  up
ip netns exec ns11 ip addr add 192.168.10.11/24 dev macvlan11 

ip netns exec ns12 ip link set macvlan12  up
ip netns exec ns12 ip addr add 192.168.10.12/24 dev macvlan12

ip netns exec ns21 ip link set macvlan21  up
ip netns exec ns21 ip addr add 192.168.10.21/24 dev macvlan21
## 跟对端通信时，通过二层网络通信，不用配置网关, 只有出外网才需要
## ip netns exec ns1 ip r add default via 172.16.117.2 dev macvlan1


# ip netns exec ns1  ping 8.8.8.8
# ip netns exec ns1  ping 172.16.117.202




