virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install.1 \
--boot=hd \
--debug \
--vcpus=2 \
--memory=1024 \
--cdrom /dev/sdc \
--disk path=/vm/centos7-virt-install,size=10 \
--network network=default \
--graphics vnc,listen=0.0.0.0 


# 目标文件不存在时

#  The simplest invocation to create a new 10G disk image and associated disk device:
#
#      --disk size=10
#
#  virt-install will generate a path name, and place it in the default image location for the hypervisor. To specify media, the command can either
#  be:
#
#      --disk /some/storage/path[,opt1=val1]...
#
#  or explicitly specify one of the following arguments:


#  --location my-unknown.iso
#[root@centos-kvm-1 vm]# qemu-img  create /vm/centos7-virt-install 10G
#Formatting '/vm/centos7-virt-install', fmt=raw size=10737418240


#[Wed, 13 Jul 2022 04:07:11 virt-install 8106] DEBUG (cli:395) Launching virt-viewer for graphics type 'vnc'
#[Wed, 13 Jul 2022 04:07:11 virt-install 8106] DEBUG (cli:370) Running: virt-viewer --connect qemu:///system --wait centos7-virt-install.1

