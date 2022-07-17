virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cpu\
--boot=hd \
--debug \
--vcpus=16 \
--memory=1024 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 

# -smp 16,sockets=16,cores=1,threads=1 
#  <vcpu placement='static'>16</vcpu>


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

