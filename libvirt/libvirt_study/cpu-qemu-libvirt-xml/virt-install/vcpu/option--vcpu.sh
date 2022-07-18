virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cpu \
--boot=hd \
--debug \
--vcpus=16 \
--memory=1024 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 

#优先展示sockets，其次是cores，其实是threads
#CPU topology can additionally be specified with sockets, cores, and threads.  
#If values are omitted, the rest will be autofilled preferring sockets over cores over threads.
#

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

