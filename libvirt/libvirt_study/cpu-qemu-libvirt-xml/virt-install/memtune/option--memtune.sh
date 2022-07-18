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
--memtune hard_limit=4182016,soft_limit=4182016,swap_hard_limit=4182016 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 


# XML 文件
#  <memtune>
#    <hard_limit unit='KiB'>4182016</hard_limit>
#    <soft_limit unit='KiB'>4182016</soft_limit>
#    <swap_hard_limit unit='KiB'>4182016</swap_hard_limit>
#  </memtune>

# qemu 没有直接表现出来
#-cpu qemu64 -m 4084 -overcommit mem-lock=off -smp 16,sockets=2,dies=1,cores=4,threads=2 -object memory-backend-ram,id=ram-node0,size=1070596096,host-nodes=0,policy=preferred -numa node,nodeid=0,cpus=0-3,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=1,cpus=4-7,memdev=ram-node1 -object memory-backend-ram,id=ram-node2,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=2,cpus=8-11,memdev=ram-node2 -object memory-backend-ram,id=ram-node3,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=3,cpus=12-15,memdev=ram-node3 -uuid 15d7773b-65f6-46ff-9d05-8211c61d2828 
# unsupported configuration: Parameter 'min_guarantee' not supported by QEMU.
#hard_limit: The units for this value are kibibytes
#soft_limit: The units for this value are kibibytes 
#swap_hard_limit: The units for this value are kibibytes
#min_guarantee: The units for this value are kibibytes
#--memtune OPTIONS
#    Tune memory policy for the domain process. Example invocations
#
#        --memtune 1000
#        --memtune hard_limit=100,soft_limit=60,swap_hard_limit=150,min_guarantee=80
#
#    Use --memtune=? to see a list of all available sub options. Complete details at <https://libvirt.org/formatdomain.html#elementsMemoryTuning>

#[root@centos-kvm-1 disk]# virt-install  --memtune=?
#--memtune options:
#  clearxml
#  hard_limit
#  min_guarantee
#  soft_limit
#  swap_hard_limit

