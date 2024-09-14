
##+=============================================================+
##|  Host: host1                                                |
##|                                                             |
##|   +----------------------+      +----------------------+    |
##|   |   NS:ns0             |      |  NS:ns1              |    |
##|   |                      |      |                      |    |
##|   |                      |      |                      |    |
##|   |        ipvtap0         |      |         ipvtap1        |    |
##|   +----------#-----------+      +-----------#----------+    |
##|              #                              #               |
##|              ################################               |
##|                              # ens160                         |
##+==============================#==============================+

# Create two network namespaces - ns0, ns1:
ip netns add ns0
ip netns add ns1

# Create two ipvtap slaves on ens160 (master device):
ip link add link ens160 ipvtap0 type ipvtap mode l2
ip link add link ens160 ipvtap1 type ipvtap mode l2

# Assign slaves to the respective network namespaces:
ip link set dev ipvtap0 netns ns0
ip link set dev ipvtap1 netns ns1

#IPADDR1=192.168.1.10/24
#IPADDR2=192.168.1.20/24
IPADDR1=172.16.117.10/24
IPADDR2=172.16.117.20/24
ROUTER=172.16.117.2
# Now switch to the namespace (ns0 or ns1) to configure the slave devices
# ip netns exec ns0 bash
# For ns0:
ip netns exec ns0 ip link set dev ipvtap0 up
ip netns exec ns0 ip link set dev lo up
ip netns exec ns0 ip -4 addr add $IPADDR1 dev ipvtap0
ip netns exec ns0 ip -4 route add default via $ROUTER dev ipvtap0


#For ns1:
ip netns exec ns1 ip link set dev ipvtap1 up
ip netns exec ns1 ip link set dev lo up
ip netns exec ns1 ip -4 addr add $IPADDR2 dev ipvtap1
ip netns exec ns1 ip -4 route add default via $ROUTER dev ipvtap1


ls /dev/tap*
