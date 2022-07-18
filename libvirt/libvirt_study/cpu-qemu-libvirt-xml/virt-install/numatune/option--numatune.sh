#!/bin/bash

virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cpu \
--boot=hd \
--debug \
--memory=4096 \
--vcpus=16,sockets=2,cores=4,threads=2 \
--cpu numa.cell0.memory=1045504,numa.cell0.cpus=0-3,numa.cell1.memory=1045504,numa.cell1.cpus=4-7,\
numa.cell2.memory=1045504,numa.cell2.cpus=8-11,numa.cell3.memory=1045504,numa.cell3.cpus=12-15 \
--numatune 0,memory.mode=strict,\
memnode0.cellid=0,memnode0.mode=preferred,memnode0.nodeset=0,\
memnode1.cellid=2,memnode1.mode=strict,memnode1.nodeset=0 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 


# 在qemu上的表现为 host-nodes=0,policy=preferred 或者 host-nodes=0,policy=bind 
# -object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align

# qemu-kvm的manual手册上: The host-nodes option binds the memory range to a list of NUMA host nodes.
# 
#The host-nodes option binds the memory range to a list of NUMA host nodes.
#The policy option sets the NUMA policy to one of the following values:
#default
#    default host policy
#preferred
#    prefer the given host node list for allocation
#bind
#    restrict memory allocation to the given host node list
#interleave
#    interleave memory allocations across the given host node list


#-smp 16,sockets=2,dies=1,cores=4,threads=2 -object memory-backend-ram,id=ram-node0,size=1070596096,host-nodes=0,policy=preferred -numa node,nodeid=0,cpus=0-3,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=1,cpus=4-7,memdev=ram-node1 -object memory-backend-ram,id=ram-node2,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=2,cpus=8-11,memdev=ram-node2 -object memory-backend-ram,id=ram-node3,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=3,cpus=12-15,memdev=ram-node3

# XML文件的表现， nodeset表示宿主机的,cellid表示虚拟机的
# 因为当前的这个宿主机上只有一个node，所以只能是0，
# 虚拟机上模拟了4个node，0~3
#  <numatune>
#    <memory mode='strict' nodeset='0'/>
#    <memnode cellid='0' mode='preferred' nodeset='0'/>
#    <memnode cellid='2' mode='strict' nodeset='0'/>
#  </numatune>

#--cpu numa.cell0.memory=2097152,numa.cell0.cpus=0-3,numa.cell1.memory=2097152,numa.cell1.cpus=4-7 \
#[root@centos-kvm-1 disk]# virt-install  --numatune=?
#--numatune options:
#  clearxml
#  memnode[0-9]*.cellid
#  memnode[0-9]*.mode
#  memnode[0-9]*.nodeset
#  memory.mode
#  memory.nodeset
#  memory.placement

#<domain>
#  ...
#  <numatune>
#    <memory mode="strict" nodeset="1-4,^3"/>
#    <memnode cellid="0" mode="strict" nodeset="1"/>
#    <memnode cellid="2" mode="preferred" nodeset="2"/>
#  </numatune>
#  ...
#</domain>


#--numatune OPTIONS
#    Tune NUMA policy for the domain process. Example invocations
#
#        --numatune 1,2,3,4-7
#        --numatune 1-3,5,memory.mode=preferred
#
#    Specifies the numa nodes to allocate memory from. This has the same syntax as "--vcpus cpuset=" option. mode can be one of 'interleave',
#    'preferred', or 'strict' (the default). See 'man 8 numactl' for information about each mode.
#
#    Use --numatune=? to see a list of all available sub options. Complete details at <https://libvirt.org/formatdomain.html#elementsNUMATuning>

