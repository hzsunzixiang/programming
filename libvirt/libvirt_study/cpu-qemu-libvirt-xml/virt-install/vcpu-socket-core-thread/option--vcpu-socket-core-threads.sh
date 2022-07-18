#!/bin/bash
virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cpu \
--boot=hd \
--debug \
--vcpus=16,sockets=2,cores=4,threads=2 \
--memory=1024 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 

# qemu 的实际命令
# -smp 16,sockets=2,dies=1,cores=4,threads=2 

# XML 信息
#  <cpu mode='custom' match='exact' check='full'>
#    <model fallback='forbid'>qemu64</model>
#    <topology sockets='2' dies='1' cores='4' threads='2'/>
#    <feature policy='require' name='x2apic'/>
#    <feature policy='require' name='hypervisor'/>
#    <feature policy='require' name='lahf_lm'/>
#    <feature policy='disable' name='svm'/>
#  </cpu>

#--vcpus=VCPUS[,maxvcpus=MAX][,sockets=#][,cores=#][,threads=#]：VCPU个数及相关配置；
#但是这里不支持die, 而 xml是支持的
#maxvcpus=32,


#--vcpus OPTIONS
#    Number of virtual cpus to configure for the guest. If 'maxvcpus' is specified, the guest will be able to hotplug up to MAX vcpus while the
#    guest is running, but will startup with VCPUS.
#
#    CPU topology can additionally be specified with sockets, cores, and threads.  If values are omitted, the rest will be autofilled preferring
#    sockets over cores over threads.
#
#    'cpuset' sets which physical cpus the guest can use. "CPUSET" is a comma separated list of numbers, which can also be specified in ranges or
#    cpus to exclude. Example:
#
#        0,2,3,5     : Use processors 0,2,3 and 5
#        1-5,^3,8    : Use processors 1,2,4,5 and 8
#
#    If the value 'auto' is passed, virt-install attempts to automatically determine an optimal cpu pinning using NUMA data, if available.
#
#    Use --vcpus=? to see a list of all available sub options. Complete details at <https://libvirt.org/formatdomain.html#elementsCPUAllocation>


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

#[root@centos-kvm-1 disk]# virt-install  --cpu ?
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

#--cputune OPTIONS
#    Tune CPU parameters for the guest.
#
#    Configure which of the host's physical CPUs the domain VCPU will be pinned to. Example invocation
#
#        --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=0-3,vcpupin1.vcpu=1,vcpupin1.cpuset=4-7
#
#    Use --cputune=? to see a list of all available sub options. Complete details at <https://libvirt.org/formatdomain.html#elementsCPUTuning>

#[root@centos-kvm-1 disk]# virt-install  --cputune=?
#--cputune options:
#  clearxml
#  vcpupin[0-9]*.cpuset
#  vcpupin[0-9]*.vcpu



#Some examples:
#
#--cpu core2duo,+x2apic,disable=vmx
#    Expose the core2duo CPU model, force enable x2apic, but do not expose vmx
#
#--cpu host
#    Expose the host CPUs configuration to the guest. This enables the guest to take advantage of many of the host CPUs features (better
#    performance), but may cause issues if migrating the guest to a host without an identical CPU.
#
#--cpu host-model-only
#    Expose the nearest host CPU model configuration to the guest.  It is the best CPU which can be used for a guest on any of the hosts.
#
#--cpu numa.cell0.memory=1234,numa.cell0.cpus=0-3,numa.cell1.memory=5678,numa.cell1.cpus=4-7
#    Example of specifying two NUMA cells. This will generate XML like:
#
#      <cpu>
#        <numa>
#          <cell cpus="0-3" memory="1234"/>
#          <cell cpus="4-7" memory="5678"/>
#        </numa>
#      </cpu>
#
#--cpu host-passthrough,cache.mode=passthrough
#    Example of passing through the host cpu's cache information.
#
#Use --cpu=? to see a list of all available sub options. Complete details at <https://libvirt.org/formatdomain.html#elementsCPU>

