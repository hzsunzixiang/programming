ip link set ens160 promisc on

# 创建 macvtap
ip link add link ens160 dev macvtap1 type macvtap mode bridge
ip link add link ens160 dev macvtap2 type macvtap mode bridge

# 创建对应的命名空间
ip netns add ns1
ip netns add ns2
ip netns list

# 放入对应的命名空间
ip link set dev macvtap1  netns ns1
ip link set dev macvtap2  netns ns2

ip netns exec ns1 ip link show
ip netns exec ns2 ip link show

# 对ns1 配置 IP 
##  防止命名空间没有正确隔离，先 kill dhclient进程
##ps aux|grep dhclient |grep -v grep | awk '{print $2}' |xargs kill -9
## 获取IP
##ip netns exec ns1 dhclient  macvtap1
## 为了防止命名空间的隔离性问题,手工ip

ip netns exec ns1 ip link set macvtap1  up
ip netns exec ns1 ip addr add 172.16.117.201/24 dev macvtap1 
## 配置网关
ip netns exec ns1 ip r add default via 172.16.117.2 dev macvtap1

# 对ns2 配置 IP 
##  防止命名空间没有正确隔离，先 kill dhclient进程
##ps aux|grep dhclient |grep -v grep | awk '{print $2}' |xargs kill -9
## 获取IP
##ip netns exec ns1 dhclient  macvtap1
## 为了防止命名空间的隔离性问题,手工ip

ip netns exec ns2 ip link set macvtap2  up
ip netns exec ns2 ip addr add 172.16.117.202/24 dev macvtap2 
## 配置网关
ip netns exec ns2 ip r add default via 172.16.117.2 dev macvtap2


# ip netns exec ns1  ping 8.8.8.8
# ip netns exec ns1  ping 172.16.117.202
ls /dev/tap*



