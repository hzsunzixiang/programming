

VIM
:%s/ -/ \\\r-/gc



sed -i 's/centos-7-simple.qcow2/centos-7-simple-from-qemu.qcow2/' 

 

sed -i 's/-chardev/#-chardev/' centos-network-virtio-format.qemu
sed -i 's/-mon/#-mon/' centos-network-virtio-format.qemu
sed -i 's/-rtc/#-rtc/' centos-network-virtio-format.qemu
sed -i 's/-no-shutdown/#-no-shutdown/' centos-network-virtio-format.qemu
sed -i 's/-object/#-object/' centos-network-virtio-format.qemu

# 结论：这个命令不能很好地还原xml
virsh domxml-to-native qemu-argv centos-network-macvtap.xml centos-network-macvtap.qemu
virsh domxml-to-native qemu-argv centos-network-macvtap.xml  > centos-network-macvtap.qemu
virsh domxml-to-native qemu-argv centos-network-isolated.xml > centos-network-isolated.qemu

