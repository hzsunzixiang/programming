#!/bin/bash

#IOMMU Group 5:
#        0000:00:11.0 PCI bridge [0604]: VMware PCI bridge [15ad:0790] (rev 02)
#        0000:02:00.0 USB controller [0c03]: VMware USB1.1 UHCI Controller [15ad:0774]
#        0000:02:01.0 Ethernet controller [0200]: Intel Corporation 82545EM Gigabit Ethernet Controller (Copper) [8086:100f] (rev 01)
#        0000:02:02.0 USB controller [0c03]: VMware USB2 EHCI Controller [15ad:0770]
#        0000:02:04.0 Ethernet controller [0200]: Intel Corporation 82545EM Gigabit Ethernet Controller (Copper) [8086:100f] (rev 01)

# 把 bridge 过滤掉，不用操作

#echo "bind the device"
##echo "0000:02:04.0" > /sys/bus/pci/devices/0000\:02\:04.0/driver/bind
#for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
#do
#    echo "$i" > /sys/bus/pci/devices/$i/driver/unbind
#done

echo "before unbind"
for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    echo "========$i================"
    lspci -nnDvs $i |grep Kernel
    echo "========$i================"
	echo
done

echo "unbind the device"
#echo "0000:02:04.0" > /sys/bus/pci/devices/0000\:02\:04.0/driver/unbind
for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    echo "$i" > /sys/bus/pci/devices/$i/driver/unbind
done

sleep 2


# here cannot find string "Kernel driver in use: vfio-pci"
echo "after unbind"
for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    echo "========$i================"
    lspci -nnDvs $i |grep Kernel
    echo "========$i================"
	echo
done

# 这里就不再编程实现了
echo "find the venderId:deviceId"
for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    lspci -nnDvs $i |grep $i
done

#0000:02:00.0 USB controller [0c03]: VMware USB1.1 UHCI Controller [15ad:0774] (prog-if 00 [UHCI])
#0000:02:01.0 Ethernet controller [0200]: Intel Corporation 82545EM Gigabit Ethernet Controller (Copper) [8086:100f] (rev 01)
#0000:02:02.0 USB controller [0c03]: VMware USB2 EHCI Controller [15ad:0770] (prog-if 20 [EHCI])
#0000:02:04.0 Ethernet controller [0200]: Intel Corporation 82545EM Gigabit Ethernet Controller (Copper) [8086:100f] (rev 01)

echo "find the venderId:deviceId"
for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    lspci -ns $i 
done
#[ericksun@centos-kvm-1 passthrough]$ for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0; do     lspci -ns $i ; done
#02:00.0 0c03: 15ad:0774
#02:01.0 0200: 8086:100f (rev 01)
#02:02.0 0c03: 15ad:0770
#02:04.0 0200: 8086:100f (rev 01)

echo "vifo new_id"
#echo "15ad 0790" > /sys/bus/pci/drivers/vfio-pci/new_id
for i in "15ad 0774" "8086 100f" "15ad 0770" "8086 100f"
do
    echo $i
    echo $i > /sys/bus/pci/drivers/vfio-pci/new_id
done 


#echo "0000:02:04.0" > /sys/bus/pci/drivers/vfio-pci/bind
#echo -n "0000:02:04.0" > /sys/bus/pci/drivers/vfio-pci/bind
for i in 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    echo "========$i================"
    lspci -nnDvs $i |grep Kernel
    echo "========$i================"
	echo
done
