qemu-kvm -m 2048 -hda /vm/centos7hda_from_qemu -hdb /vm/data_disk.img  -hdd /vm/data_disk2.img -cdrom /root/CentOS-7-x86_64-DVD-2009.i
so -vnc 0.0.0.0:7 -monitor stdio


#       -hda file
#       -hdb file
#       -hdc file
#       -hdd file
#           Use file as hard disk 0, 1, 2 or 3 image.
#
#       -cdrom file
#           Use file as CD-ROM image (you cannot use -hdc and -cdrom at the same time). You can use the host CD-ROM by using /dev/cdrom as filename.


