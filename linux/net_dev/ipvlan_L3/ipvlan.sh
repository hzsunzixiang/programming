
##+=============================================================+
##|  Host: host1                                                |
##|                                                             |
##|   +----------------------+      +----------------------+    |
##|   |   NS:ns5             |      |  NS:ns6              |    |
##|   |                      |      |                      |    |
##|   |                      |      |                      |    |
##|   |        ipvl1         |      |         ipvl2        |    |
##|   +----------#-----------+      +-----------#----------+    |
##|              #                              #               |
##|              ################################               |
##|                              # ens160                         |
##+==============================#==============================+

# add the namespaces
ip netns add ns5
ip netns add ns6
 
# create the macvlan link attaching it to the parent host ens160
ip link add ipv1 link ens160 type ipvlan mode l3
ip link add ipv2 link ens160 type ipvlan mode l3
 
# move the new interface ipv1/ipv2 to the new namespace
ip link set ipv1 netns ns5
ip link set ipv2 netns ns6
 
# bring the two interfaces up
ip netns exec ns5 ip link set dev ipv1 up
ip netns exec ns6 ip link set dev ipv2 up
 
# set ip addresses
ip netns exec ns5 ifconfig ipv1 10.1.100.10/24 up
ip netns exec ns6 ifconfig ipv2 192.168.100.10/24 up
 
# add default routes
ip netns exec ns5 ip route add default dev ipv1
ip netns exec ns6 ip route add default dev ipv2
# view the namespace default gateway (interface not next hop IP)
ip netns exec ns5 ip route
ip netns exec ns6 ip route
 
# ping from one ns to another
ip netns exec ns5 ping 192.168.100.10
 
## cleanup
#ip netns del ns5
#ip netns del ns6
