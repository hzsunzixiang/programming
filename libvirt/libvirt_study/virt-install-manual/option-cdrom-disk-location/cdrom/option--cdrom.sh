#!/bin/bash
virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cdrom  \
--boot=hd \
--debug \
--vcpus=2 \
--memory=1024 \
--disk path=/vm/centos7-virt-install \
--cdrom /root/CentOS-7-x86_64-Minimal-2009.iso \
--network network=default \
--graphics vnc,listen=0.0.0.0 



# 只要有 --cdrom 就一定是安装系统，此时用--boot=hd 也无法直接运行系统
# 可以看到一个qcow2 ,一个 cdrom
# -blockdev {"driver":"file","filename":"/vm/centos7-virt-install","node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"} \
# -blockdev {"node-name":"libvirt-2-format","read-only":false,"driver":"qcow2","file":"libvirt-2-storage","backing":null} \
# -device virtio-blk-pci,scsi=off,bus=pci.4,addr=0x0,drive=libvirt-2-format,id=virtio-disk0,bootindex=2 \
# -blockdev {"driver":"file","filename":"/root/CentOS-7-x86_64-Minimal-2009.iso","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"} \ 
# -blockdev {"node-name":"libvirt-1-format","read-only":true,"driver":"raw","file":"libvirt-1-storage"} \
# -device ide-cd,bus=ide.0,drive=libvirt-1-format,id=sata0-0-0,bootindex=1 

#    <disk type='file' device='disk'>
#      <driver name='qemu' type='qcow2'/>
#      <source file='/vm/centos7-virt-install' index='2'/>
#      <backingStore/>
#      <target dev='vda' bus='virtio'/>
#      <alias name='virtio-disk0'/>
#      <address type='pci' domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
#    </disk>
#    <disk type='file' device='cdrom'>
#      <driver name='qemu' type='raw'/>
#      <source file='/root/CentOS-7-x86_64-Minimal-2009.iso' index='1'/>
#      <backingStore/>
#      <target dev='sda' bus='sata'/>
#      <readonly/>
#      <alias name='sata0-0-0'/>
#      <address type='drive' controller='0' bus='0' target='0' unit='0'/>
#    </disk>
