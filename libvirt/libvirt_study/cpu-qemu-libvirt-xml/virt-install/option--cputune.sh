#!/bin/bash

virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cpu \
--boot=hd \
--debug \
--vcpus=16,cpuset=0,2 \
--cputune vcpupin0.vcpu=0,vcpupin0.cpuset=0-1,vcpupin1.vcpu=1,vcpupin1.cpuset=2-3 \
--memory=1024 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 


# XML的体现
#  <vcpu placement='static' cpuset='0,2'>16</vcpu>
#  <cputune>
#    <vcpupin vcpu='0' cpuset='0-1'/>
#    <vcpupin vcpu='1' cpuset='2-3'/>
#  </cputune>

# qemu 好像没有提现出来

#优先展示sockets，其次是cores，其实是threads
#CPU topology can additionally be specified with sockets, cores, and threads.  
#If values are omitted, the rest will be autofilled preferring sockets over cores over threads.
#

#[root@centos-kvm-1 disk]# virt-install --cputune=?
#--cputune options:
#  clearxml
#  vcpupin[0-9]*.cpuset
#  vcpupin[0-9]*.vcpu

#[root@centos-kvm-1 disk]# virt-install --vcpus=?
#--vcpus options:
#  clearxml
#  cores
#  cpuset
#  maxvcpus
#  sockets
#  threads
#  vcpu
#  vcpu.cpuset
#  vcpu.current
#  vcpu.placement
#  vcpus
#  vcpus.vcpu[0-9]*.enabled
#  vcpus.vcpu[0-9]*.hotpluggable
#  vcpus.vcpu[0-9]*.id
#  vcpus.vcpu[0-9]*.order

