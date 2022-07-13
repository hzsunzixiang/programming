virt-install  --name=centos7-virt-install \
	--vcpus=2 \
	--memory=1024 \
	--disk path=/vm/centos7hda_from_qemu  \
	--cdrom /root/CentOS-7-x86_64-Minimal-2009.iso \
	--graphics vnc,listen=0.0.0.0 \
	--print-xml  --dry-run


#这样运行时错误的

# [root@centos-kvm-1 virt-install-to-xml]# virt-install  --name=centos7-virt-install         --vcpus=2         --memory=1024         --disk path=/vm/centos7hda_from_qemu          --graphics vnc,listen=0.0.0.0
# ERROR
# An install method must be specified
# (--location URL, --cdrom CD/ISO, --pxe, --import, --boot hd|cdrom|...)

