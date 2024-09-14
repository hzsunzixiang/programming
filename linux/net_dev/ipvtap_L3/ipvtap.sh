
##+=============================================================+
##|  Host: host1                                                |
##|                                                             |
##|   +----------------------+      +----------------------+    |
##|   |   NS:ns5             |      |  NS:ns6              |    |
##|   |                      |      |                      |    |
##|   |                      |      |                      |    |
##|   |        ipvtapl1         |      |         ipvtapl2        |    |
##|   +----------#-----------+      +-----------#----------+    |
##|              #                              #               |
##|              ################################               |
##|                              # ens160                         |
##+==============================#==============================+

# add the namespaces
ip netns add ns5
ip netns add ns6
 
# create the macvlan link attaching it to the parent host ens160
ip link add ipvtap1 link ens160 type ipvtap mode l3
ip link add ipvtap2 link ens160 type ipvtap mode l3
 
# move the new interface ipvtap1/ipvtap2 to the new namespace
ip link set ipvtap1 netns ns5
ip link set ipvtap2 netns ns6
 
# bring the two interfaces up
ip netns exec ns5 ip link set dev ipvtap1 up
ip netns exec ns6 ip link set dev ipvtap2 up
 
# set ip addresses
ip netns exec ns5 ifconfig ipvtap1 10.1.100.10/24 up
ip netns exec ns6 ifconfig ipvtap2 192.168.100.10/24 up
 
# add default routes
ip netns exec ns5 ip route add default dev ipvtap1
ip netns exec ns6 ip route add default dev ipvtap2
# view the namespace default gateway (interface not next hop IP)
ip netns exec ns5 ip route
ip netns exec ns6 ip route
 
ls /dev/tap*

# ping from one ns to another
ip netns exec ns5 ping 192.168.100.10

