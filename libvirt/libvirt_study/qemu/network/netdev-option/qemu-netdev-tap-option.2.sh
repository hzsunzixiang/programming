

/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot d \
-drive file=/vm/centos7hda_from_qemu,if=virtio,format=raw \
-netdev tap,id=nd0 -device e1000,netdev=nd0 \
-netdev tap,id=nd1 -device e1000e,netdev=nd1 \
-netdev tap,id=nd2 -device rtl8139,netdev=nd2 \
-netdev tap,id=nd3 -device virtio-net,netdev=nd3 \
-vnc 0.0.0.0:7 -k en-us 

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

