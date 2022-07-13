virt-install  --connect qemu:///system \
--name=centos7-virt-install-raw-format \
--boot=hd \
--debug \
--vcpus=2 \
--memory=1024 \
--cdrom /root/CentOS-7-x86_64-Minimal-2009.iso \
--disk path=/vm/centos7_raw_format.raw,size=5,format=raw \
--network network=default \
--graphics vnc,listen=0.0.0.0 \
--noautoconsole


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

#    format
#        Disk image format. For file volumes, this can be 'raw', 'qcow2', 'vmdk', etc. See format types in <https://libvirt.org/storage.html> for
#        possible values. This is often mapped to the driver_type value as well.
#        If not specified when creating file images, this will default to 'qcow2'.
#        If creating storage, this will be the format of the new image. If using an existing image, this overrides libvirt's format auto-detection.


#  --location my-unknown.iso
#[root@centos-kvm-1 vm]# qemu-img  create /vm/centos7-virt-install 10G
#Formatting '/vm/centos7-virt-install', fmt=raw size=10737418240


#[Wed, 13 Jul 2022 04:07:11 virt-install 8106] DEBUG (cli:395) Launching virt-viewer for graphics type 'vnc'
#[Wed, 13 Jul 2022 04:07:11 virt-install 8106] DEBUG (cli:370) Running: virt-viewer --connect qemu:///system --wait centos7-virt-install.1

