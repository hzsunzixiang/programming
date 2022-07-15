#/bin/bash


/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot c \
-drive file=/vm/centos7hda_from_qemu,if=virtio,index=0,media=disk,format=raw \
-drive file=/dev/sdc,if=ide,media=disk,format=raw \
-netdev bridge,br=virbr0,id=n4 -device virtio-net,netdev=n4 \
-vnc 0.0.0.0:7 -k en-us 


# 加上这个起不来


# The x86 PC uses: a, b (floppy 1 and 2), c (first hard disk), d (first CD-ROM), n-p (Etherboot from network adapter 1-4), hard disk boot is the default.

#-blockdev '{"driver":"file","filename":"/vm/centos-7-simple-from-qemu.qcow2","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}' \
#-blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2","file":"libvirt-1-storage"}' \
#
#       -drive option[,option[,option[,...]]]
#           Define a new drive. This includes creating a block driver node (the backend) as well as a guest device, and is mostly a shortcut for defining
#           the corresponding -blockdev and -device options.
#
#           -drive accepts all options that are accepted by -blockdev. In addition, it knows the following options:
#
#           file=file
#               This option defines which disk image to use with this drive. If the filename contains comma, you must double it (for instance,
#               "file=my,,file" to use file "my,file").
#
#               Special files such as iSCSI devices can be specified using protocol specific URLs. See the section for "Device URL Syntax" for more
#               information.
#
#           if=interface
#               This option defines on which type on interface the drive is connected.  Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio,
#               none.
#           format=format
#               Specify which disk format will be used rather than detecting the format.  Can be used to specify format=raw to avoid interpreting an
#               untrusted format header.
#
#
#           Instead of -cdrom you can use:
#
#                   qemu-kvm -drive file=file,index=2,media=cdrom
#
#           Instead of -hda, -hdb, -hdc, -hdd, you can use:
#
#                   qemu-kvm -drive file=file,index=0,media=disk
#                   qemu-kvm -drive file=file,index=1,media=disk
#                   qemu-kvm -drive file=file,index=2,media=disk
#                   qemu-kvm -drive file=file,index=3,media=disk
#
#           You can open an image using pre-opened file descriptors from an fd set:
#
#                   qemu-kvm \
#                   -add-fd fd=3,set=2,opaque="rdwr:/path/to/file" \
#                   -add-fd fd=4,set=2,opaque="rdonly:/path/to/file" \
#                   -drive file=/dev/fdset/2,index=0,media=disk
#
#           You can connect a CDROM to the slave of ide0:
#
#                   qemu-kvm -drive file=file,if=ide,index=1,media=cdrom
#
#           If you don't specify the "file=" argument, you define an empty drive:
#
#                   qemu-kvm -drive if=ide,index=1,media=cdrom
#
#           Instead of -fda, -fdb, you can use:
#
#                   qemu-kvm -drive file=file,index=0,if=floppy
#                   qemu-kvm -drive file=file,index=1,if=floppy
#
#           By default, interface is "ide" and index is automatically incremented:
#
#                   qemu-kvm -drive file=a -drive file=b"
#
#           is interpreted like:
#
#                   qemu-kvm -hda a -hdb b
#
