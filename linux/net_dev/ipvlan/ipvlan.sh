
##+=============================================================+
##|  Host: host1                                                |
##|                                                             |
##|   +----------------------+      +----------------------+    |
##|   |   NS:ns0             |      |  NS:ns1              |    |
##|   |                      |      |                      |    |
##|   |                      |      |                      |    |
##|   |        ipvl0         |      |         ipvl1        |    |
##|   +----------#-----------+      +-----------#----------+    |
##|              #                              #               |
##|              ################################               |
##|                              # ens160                         |
##+==============================#==============================+

# Create two network namespaces - ns0, ns1:
ip netns add ns0
ip netns add ns1

# Create two ipvlan slaves on ens160 (master device):
ip link add link ens160 ipvl0 type ipvlan mode l2
ip link add link ens160 ipvl1 type ipvlan mode l2

# Assign slaves to the respective network namespaces:
ip link set dev ipvl0 netns ns0
ip link set dev ipvl1 netns ns1

#IPADDR1=192.168.1.10/24
#IPADDR2=192.168.1.20/24
IPADDR1=172.16.117.10/24
IPADDR2=172.16.117.20/24
ROUTER=172.16.117.2
# Now switch to the namespace (ns0 or ns1) to configure the slave devices
# ip netns exec ns0 bash
ip netns exec ns0 ip link set dev ipvl0 up
ip netns exec ns0 ip link set dev lo up
ip netns exec ns0 ip -4 addr add 127.0.0.1 dev lo
ip netns exec ns0 ip -4 addr add $IPADDR1 dev ipvl0
ip netns exec ns0 ip -4 route add default via $ROUTER dev ipvl0

#For ns0:

#(1) ip netns exec ns0 bash
#(2) ip link set dev ipvl0 up
#(3) ip link set dev lo up
#(4) ip -4 addr add 127.0.0.1 dev lo
#(5) ip -4 addr add $IPADDR dev ipvl0
#(6) ip -4 route add default via $ROUTER dev ipvl0

#For ns1:
ip netns exec ns1 ip link set dev ipvl1 up
ip netns exec ns1 ip link set dev lo up
ip netns exec ns1 ip -4 addr add 127.0.0.1 dev lo
ip netns exec ns1 ip -4 addr add $IPADDR2 dev ipvl1
ip netns exec ns1 ip -4 route add default via $ROUTER dev ipvl1
#
#(1) ip netns exec ns1 bash
#(2) ip link set dev ipvl1 up
#(3) ip link set dev lo up
#(4) ip -4 addr add 127.0.0.1 dev lo
#(5) ip -4 addr add $IPADDR dev ipvl1
#(6) ip -4 route add default via $ROUTERdev ipvl1
