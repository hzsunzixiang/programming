virt-install  --import \
	--name=centos7-virt-install \
	--vcpus=2 \
	--memory currentMemory=1024,maxMemory=2048 \
	--disk path=/vm/centos7hda_from_qemu  \
	--graphics vnc,listen=0.0.0.0 \
	--print-xml  --dry-run

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

