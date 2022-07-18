#!/bin/bash
virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cpu \
--boot=hd \
--debug \
--memory=4096 \
--vcpus=8,sockets=2,cores=2,threads=2 \
--cpu numa.cell0.memory=2097152,numa.cell0.cpus=0-3,numa.cell1.memory=2097152,numa.cell1.cpus=4-7 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 


#memory specifies the node memory in kibibytes (i.e. blocks of 1024 bytes).
# 注意这里的单位是kb, 不然内存太小系统起不来
#--cpu numa.cell0.memory=1024,numa.cell0.cpus=0-3 \
#--cpu numa.cell0.memory=1024,numa.cell0.cpus=0-1,numa.cell1.memory=1024,numa.cell1.cpus=2-3 \
#--cpu numa.cell0.memory=64,numa.cell0.cpus=0-7,numa.cell1.memory=64,numa.cell1.cpus=8-15 \
# 错误--cpu numa.cell0.cpus=0-7,numa.cell1.cpus=8-15 \
#  numa.cell[0-9]*.cpus
#  numa.cell[0-9]*.distances.sibling[0-9]*.id
#  numa.cell[0-9]*.distances.sibling[0-9]*.value
#  numa.cell[0-9]*.id
#  numa.cell[0-9]*.memory

#--cpu numa.cell0.memory=1234,numa.cell0.cpus=0-3,numa.cell1.memory=5678,numa.cell1.cpus=4-7
#    Example of specifying two NUMA cells. This will generate XML like:
#
#      <cpu>
#        <numa>
#          <cell cpus="0-3" memory="1234"/>
#          <cell cpus="4-7" memory="5678"/>
#        </numa>
#      </cpu>


#[root@centos-kvm-1 disk]# virt-install  --cpu=?
#--cpu options:
#  clearxml
#  cache.level
#  cache.mode
#  disable
#  forbid
#  force
#  match
#  mode
#  model
#  numa.cell[0-9]*.cpus
#  numa.cell[0-9]*.distances.sibling[0-9]*.id
#  numa.cell[0-9]*.distances.sibling[0-9]*.value
#  numa.cell[0-9]*.id
#  numa.cell[0-9]*.memory
#  optional
#  require
#  secure
#  topology.cores
#  topology.sockets
#  topology.threads
#  vendor

# 如上的cpu信息跟这个 XML 信息相对应
#  <cpu mode='custom' match='exact' check='full'>
#    <model fallback='forbid'>qemu64</model>
#    <topology sockets='2' dies='1' cores='4' threads='2'/>
#    <feature policy='require' name='x2apic'/>
#    <feature policy='require' name='hypervisor'/>
#    <feature policy='require' name='lahf_lm'/>
#    <feature policy='disable' name='svm'/>
#  </cpu>

# qemu 的实际命令
# -smp 16,sockets=2,dies=1,cores=4,threads=2 

