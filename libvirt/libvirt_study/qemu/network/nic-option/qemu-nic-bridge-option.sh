#!/bin/bash

/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot d \
-drive file=/vm/centos7hda_from_qemu,if=virtio,format=raw \
-nic bridge,br=virbr0,model=e1000 \
-nic bridge,br=virbr0,model=e1000e \
-nic bridge,br=virbr0,model=rtl8139 \
-nic bridge,br=virbr0,model=virtio-net-pci \
-vnc 0.0.0.0:7 -k en-us 

# [root@centos-kvm-1 nic-option]# qemu-kvm -nic help
# Available netdev backend types:
# socket
# hubport
# tap
# user
# l2tpv3
# bridge
# vhost-user

#-nic tap,model=e1000  model=help
# -nic bridge,br=virbr0,ipv6=off,model=e1000 \
#qemu-kvm -device help
#
#Network devices:
#name "e1000", bus PCI, alias "e1000-82540em", desc "Intel Gigabit Ethernet"
#name "e1000e", bus PCI, desc "Intel 82574L GbE Controller"
#name "rtl8139", bus PCI
#name "virtio-net-device", bus virtio-bus
#name "virtio-net-pci", bus PCI, alias "virtio-net"
#name "virtio-net-pci-non-transitional", bus PCI
#name "virtio-net-pci-transitional", bus PCI

