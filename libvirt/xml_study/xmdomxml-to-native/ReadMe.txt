virsh 转换
virsh domxml-to-native qemu-argv centos-simple-disk-virtio.xml > centos-simple-disk-virtio.qemu

VIM 操作
:%s/ -/\r-/gc

# 对比
centos-simple-disk-virtio.qemu.sh.format 为实际运行的命令行
centos-simple-disk-virtio.qemu.process.sh 是运行之后的进程

可以看出几乎一模一样, 也就是运行时去掉了单引号
这是一个没有网络的

vimdiff centos-simple-disk-virtio.qemu.sh.format centos-simple-disk-virtio.qemu.process.sh

20,21c19,20
< -blockdev '{"driver":"file","filename":"/vm/centos-7-simple-from-qemu.qcow2","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}'
< -blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2","file":"libvirt-1-storage"}'
---
> -blockdev {"driver":"file","filename":"/vm/centos-7-simple-from-qemu.qcow2","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}
> -blockdev {"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2","file":"libvirt-1-storage"}

