ip link set ens160 promisc on

# 创建 macvlan
ip link add link ens160 dev macvlan1 type macvlan mode bridge
ip link add link ens160 dev macvlan2 type macvlan mode bridge

# 创建对应的命名空间
ip netns add ns1
ip netns add ns2
ip netns list

# 放入对应的命名空间
ip link set dev macvlan1  netns ns1
ip link set dev macvlan2  netns ns2

ip netns exec ns1 ip link show
ip netns exec ns2 ip link show

# 对ns1 配置 IP 
##  防止命名空间没有正确隔离，先 kill dhclient进程
##ps aux|grep dhclient |grep -v grep | awk '{print $2}' |xargs kill -9
## 获取IP
##ip netns exec ns1 dhclient  macvlan1
## 为了防止命名空间的隔离性问题,手工ip

ip netns exec ns1 ip link set macvlan1  up
ip netns exec ns1 ip addr add 172.16.117.201/24 dev macvlan1 
## 配置网关
ip netns exec ns1 ip r add default via 172.16.117.2 dev macvlan1

# 对ns2 配置 IP 
##  防止命名空间没有正确隔离，先 kill dhclient进程
##ps aux|grep dhclient |grep -v grep | awk '{print $2}' |xargs kill -9
## 获取IP
##ip netns exec ns1 dhclient  macvlan1
## 为了防止命名空间的隔离性问题,手工ip

ip netns exec ns2 ip link set macvlan2  up
ip netns exec ns2 ip addr add 172.16.117.202/24 dev macvlan2 
## 配置网关
ip netns exec ns2 ip r add default via 172.16.117.2 dev macvlan2


# ip netns exec ns1  ping 8.8.8.8
# ip netns exec ns1  ping 172.16.117.202




