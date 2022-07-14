virt-install \
	--name centos7-virt-install \
	--memory 2048 \
	--vcpus 2 \
	--disk path=/vm/centos7-virt-install.qcow2,size=8 \
	--cdrom /root/CentOS-7-x86_64-Minimal-2009.iso \
	--print-xml  --dry-run



#ERROR    Disk /vm/centos7-virt-install.qcow2 is already in use by other guests ['centos7-virt-install']. (Use --check path_in_use=off or --check all=off to override)
