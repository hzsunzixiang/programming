
#<interface type="network">
#  <mac address="52:54:00:91:3b:6e"/>
#  <source network="default" portid="472f125f-5075-4940-8008-d08b43cd81d9" bridge="virbr0"/>
#  <target dev="vnet33"/>
#  <model type="virtio"/>
#  <alias name="net0"/>
#  <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
#</interface>



/usr/libexec/qemu-kvm \
-name guest=centos-network-isolated,debug-threads=on \
-S \
-object secret,id=masterKey0,format=raw,file=/var/lib/libvirt/qemu/domain-48-centos-network-isola/master-key.aes \
-machine pc-q35-rhel8.2.0,accel=kvm,usb=off,dump-guest-core=off \
-cpu qemu64 \
-m 1024 \
-overcommit mem-lock=off \
-smp 2,sockets=2,cores=1,threads=1 \
-uuid 4d6edd48-1cbe-4b6f-89ac-415baff6f1e8 \
-no-user-config \
-nodefaults \
-chardev socket,id=charmonitor,fd=37,server,nowait \
-mon chardev=charmonitor,id=monitor,mode=control \
-rtc base=utc \
-no-shutdown \
-no-acpi \
-boot strict=on \
-device pcie-root-port,port=0x10,chassis=1,id=pci.1,bus=pcie.0,multifunction=on,addr=0x2 \
-device pcie-root-port,port=0x11,chassis=2,id=pci.2,bus=pcie.0,addr=0x2.0x1 \
-device pcie-root-port,port=0x12,chassis=3,id=pci.3,bus=pcie.0,addr=0x2.0x2 \
-device pcie-root-port,port=0x13,chassis=4,id=pci.4,bus=pcie.0,addr=0x2.0x3 \
-device pcie-root-port,port=0x14,chassis=5,id=pci.5,bus=pcie.0,addr=0x2.0x4 \
-device qemu-xhci,id=usb,bus=pci.2,addr=0x0 \
-blockdev {"driver":"file","filename":"/vm/centos-7-simple.qcow2","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"} \
-blockdev {"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2","file":"libvirt-1-storage","backing":null} \
-device virtio-blk-pci,scsi=off,bus=pci.3,addr=0x0,drive=libvirt-1-format,id=virtio-disk0,bootindex=1 \
-netdev tap,fd=39,id=hostnet0,vhost=on,vhostfd=40 \
-device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:91:3b:6e,bus=pci.1,addr=0x0 \
-vnc 0.0.0.0:0 \
-k en-us \
-device cirrus-vga,id=video0,bus=pcie.0,addr=0x1 \
-device virtio-balloon-pci,id=balloon0,bus=pci.4,addr=0x0 \
-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
-msg timestamp=on

