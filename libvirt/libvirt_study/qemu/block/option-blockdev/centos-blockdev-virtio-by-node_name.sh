#/bin/bash


/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot c \
--blockdev file,node-name=f1,filename=/vm/cento64_7.2.qcow2 \
--blockdev qcow2,node-name=q1,file=f1 \
--device ide-hd,drive=q1 \
-netdev bridge,br=virbr0,id=n4 -device virtio-net,netdev=n4 \
-vnc 0.0.0.0:7 -k en-us


# 这里用的是第一种方式 通过 node-name 来引用
# Options that expect a reference to another node (e.g. "file") can be given in two ways. 
# Either you specify the node name of an already existing node (file=node-name), 
# or you define a new node inline, adding options for the referenced node after a dot  (file.filename=path,file.aio=native).

# 指定 原始文件的位置: file 
# --blockdev file,node-name=f1,filename=/vm/cento64_7.2.qcow2 \
# 指定qcow2格式, 最终 为 -device 所引用
# --blockdev qcow2,node-name=q1,file=f1 \
# 引用，创建真正的设备
# --device ide-hd,drive=q1 \

#-blockdev '{"driver":"file","filename":"/vm/centos-7-simple-from-qemu.qcow2","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}' \
#-blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2","file":"libvirt-1-storage"}' \
#-device virtio-blk-pci,scsi=off,bus=pci.3,addr=0x0,drive=libvirt-1-format,id=virtio-disk0,bootindex=1 \


# Storage devices:
# name "floppy", bus floppy-bus, desc "virtual floppy drive"
# name "ich9-ahci", bus PCI, alias "ahci"
# name "ide-cd", bus IDE, desc "virtual IDE CD-ROM"
# name "ide-drive", bus IDE, desc "virtual IDE disk or CD-ROM (legacy)"
# name "ide-hd", bus IDE, desc "virtual IDE disk"
# name "isa-fdc", bus ISA
# name "scsi-block", bus SCSI, desc "SCSI block device passthrough"
# name "scsi-cd", bus SCSI, desc "virtual SCSI CD-ROM"
# name "scsi-disk", bus SCSI, desc "virtual SCSI disk or CD-ROM (legacy)"
# name "scsi-generic", bus SCSI, desc "pass through generic scsi device (/dev/sg*)"
# name "scsi-hd", bus SCSI, desc "virtual SCSI disk"
# name "usb-bot", bus usb-bus
# name "usb-storage", bus usb-bus
# name "vhost-user-fs-device", bus virtio-bus
# name "vhost-user-fs-pci", bus PCI
# name "virtio-blk-device", bus virtio-bus
# name "virtio-blk-pci", bus PCI, alias "virtio-blk"
# name "virtio-blk-pci-non-transitional", bus PCI
# name "virtio-blk-pci-transitional", bus PCI
# name "virtio-scsi-device", bus virtio-bus
# name "virtio-scsi-pci", bus PCI, alias "virtio-scsi"
# name "virtio-scsi-pci-non-transitional", bus PCI
# name "virtio-scsi-pci-transitional", bus PCI
