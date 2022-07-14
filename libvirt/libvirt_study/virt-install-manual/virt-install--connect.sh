virt-install  --import \
        --connect qemu:///system \
	--name=centos7-virt-install \
	--vcpus=2 \
	--memory currentMemory=1024,maxMemory=2048 \
	--disk path=/vm/centos7hda_from_qemu  \
	--graphics vnc,listen=0.0.0.0 \
	--print-xml  --dry-run


#       --connect URI
#           Connect to a non-default hypervisor. If this isn't specified, libvirt will try and choose the most suitable default.
#
#           Some valid options here are:
#
#           qemu:///system
#               For creating KVM and QEMU guests to be run by the system libvirtd instance.  This is the default mode that virt-manager uses, and what most
#               KVM users want.
#
#           qemu:///session
#               For creating KVM and QEMU guests for libvirtd running as the regular user.
#
#           xen:///
#               For connecting to Xen.
#
#           lxc:///
#               For creating linux containers
#

#    Many arguments have sub options, specified like opt1=foo,opt2=bar, etc. Try --option=? to see a complete list of sub options associated with that
#       argument, example: virt-install --disk=?

#[root@centos-kvm-1 virt-install-manual]# virt-install  --memory=?
#--memory options:
#  clearxml
#  currentMemory
#  hugepages
#  maxMemory
#  maxMemory.slots
#  maxmemory
#  memory

