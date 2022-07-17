virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cdrom  \
--boot=hd \
--debug \
--vcpus=2 \
--memory=1024 \
--disk path=/vm/centos7-virt-install,device=disk \
--disk /root/CentOS-7-x86_64-Minimal-2009.iso,device=cdrom,bus=ide \
--network network=default \
--graphics vnc,listen=0.0.0.0 

#-device ide-cd,bus=ide.0,unit=1,drive=libvirt-1-format,id=ide0-0-1


#Some example device configuration suboptions:
#
#device
#    Disk device type. Example values are be 'cdrom', 'disk', 'lun' or 'floppy'. The default is 'disk'.
#
#target.bus or bus
#    Disk bus type. Example values are be 'ide', 'sata', 'scsi', 'usb', 'virtio' or 'xen'.  The default is hypervisor dependent since not all
#    hypervisors support all bus types.
#
#-blockdev {"driver":"file","filename":"/vm/centos7-virt-install","node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"} \
#-blockdev {"node-name":"libvirt-2-format","read-only":false,"driver":"qcow2","file":"libvirt-2-storage","backing":null} \
#-device ide-hd,bus=ide.0,unit=0,drive=libvirt-2-format,id=ide0-0-0,bootindex=1 \
#-blockdev {"driver":"file","filename":"/root/CentOS-7-x86_64-Minimal-2009.iso","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"} \
#-blockdev {"node-name":"libvirt-1-format","read-only":true,"driver":"raw","file":"libvirt-1-storage"} \
#-device ide-cd,bus=ide.0,unit=1,drive=libvirt-1-format,id=ide0-0-1

#    <disk type='file' device='disk'>
#      <driver name='qemu' type='qcow2'/>
#      <source file='/vm/centos7-virt-install' index='2'/>
#      <backingStore/>
#      <target dev='hda' bus='ide'/>
#      <alias name='ide0-0-0'/>
#      <address type='drive' controller='0' bus='0' target='0' unit='0'/>
#    </disk>
#    <disk type='file' device='cdrom'>
#      <driver name='qemu' type='raw'/>
#      <source file='/root/CentOS-7-x86_64-Minimal-2009.iso' index='1'/>
#      <backingStore/>
#      <target dev='hdb' bus='ide'/>
#      <readonly/>
#      <alias name='ide0-0-1'/>
#      <address type='drive' controller='0' bus='0' target='0' unit='1'/>
#    </disk>
