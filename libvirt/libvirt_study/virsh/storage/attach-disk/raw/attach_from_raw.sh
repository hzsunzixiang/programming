virsh attach-disk centos7-virt-install-cpu \
--source /vm/centos7-vm-disk-512M-raw.1 --target vdb \
--driver qemu --subdriver raw --targetbus virtio --persistent

#    <disk type='file' device='disk'>
#      <driver name='qemu' type='raw'/>
#      <source file='/vm/centos7-vm-disk-512M-raw.1' index='2'/>
#      <backingStore/>
#      <target dev='vdb' bus='virtio'/>
#      <alias name='virtio-disk1'/>
#      <address type='pci' domain='0x0000' bus='0x00' slot='0x07' function='0x0'/>
#    </disk>
