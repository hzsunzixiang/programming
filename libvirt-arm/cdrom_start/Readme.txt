%s/ -/\r-/gc


# 从cdrom启动的时候index的大小决定顺序
<disk type="file" device="cdrom">
  <driver name="qemu" type="raw"/>
  <source file="/home/ericksun/vm/ubuntu-24.04.1-live-server-arm64.iso" index="1"/>
  <backingStore/>
  <target dev="sda" bus="scsi"/>
  <readonly/>
  <alias name="scsi0-0-0-0"/>
  <address type="drive" controller="0" bus="0" target="0" unit="0"/>
</disk>

<disk type="file" device="disk">
  <driver name="qemu" type="qcow2" discard="unmap"/>
  <source file="/var/lib/libvirt/images/ubuntu24.04-2.qcow2" index="2"/>
  <backingStore/>
  <target dev="vda" bus="virtio"/>
  <alias name="virtio-disk0"/>
  <address type="pci" domain="0x0000" bus="0x05" slot="0x00" function="0x0"/>
</disk>


# 从硬盘启动

<disk type='file' device='disk'>
  <driver name='qemu' type='qcow2'/>
  <source file='/home/ericksun/vm/ubuntu-24.04-server-cloudimg-arm64.img' index='1'/>
  <backingStore/>
  <target dev='vda' bus='virtio'/>
  <alias name='virtio-disk0'/>
  <address type='pci' domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
</disk>
