#!/bin/bash


#IOMMU Group 6:
#        0000:00:15.0 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:00:15.1 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:00:15.2 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:00:15.3 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:00:15.4 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:00:15.5 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:00:15.6 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:00:15.7 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01)
#        0000:03:00.0 USB controller [0c03]: VMware USB3 xHCI 1.0 Controller [15ad:0779]
#

# 把 bridge 过滤掉，不用操作
BUS_SET="0000:00:15.0 0000:00:15.1 0000:00:15.2 0000:00:15.3 0000:00:15.4 0000:00:15.5 0000:00:15.6 0000:00:15.7 0000:03:00.0"

echo "before unbind"
for i in $BUS_SET
do
    echo "========$i================"
    lspci -nnDvs $i |grep Kernel
    echo "========$i================"
	echo
done

echo "unbind the device"
#echo "0000:02:04.0" > /sys/bus/pci/devices/0000\:02\:04.0/driver/unbind
for i in  $BUS_SET
do
    echo "$i" > /sys/bus/pci/devices/$i/driver/unbind
done

sleep 2


# here cannot find string "Kernel driver in use: vfio-pci"
echo "after unbind"
for i in $BUS_SET 
do
    echo "========$i================"
    lspci -nnDvs $i |grep Kernel
    echo "========$i================"
	echo
done

# 这里就不再编程实现了
echo "find the venderId:deviceId"
for i in $BUS_SET
do
    lspci -nnDvs $i |grep $i
done

# 0000:00:15.0 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:00:15.1 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:00:15.2 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:00:15.3 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:00:15.4 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:00:15.5 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:00:15.6 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:00:15.7 PCI bridge [0604]: VMware PCI Express Root Port [15ad:07a0] (rev 01) (prog-if 00 [Normal decode])
# 0000:03:00.0 USB controller [0c03]: VMware USB3 xHCI 1.0 Controller [15ad:0779] (prog-if 30 [XHCI])

echo "find the venderId:deviceId"
for i in $BUS_SET
do
    lspci -ns $i 
done

#00:15.0 0604: 15ad:07a0 (rev 01)
#00:15.1 0604: 15ad:07a0 (rev 01)
#00:15.2 0604: 15ad:07a0 (rev 01)
#00:15.3 0604: 15ad:07a0 (rev 01)
#00:15.4 0604: 15ad:07a0 (rev 01)
#00:15.5 0604: 15ad:07a0 (rev 01)
#00:15.6 0604: 15ad:07a0 (rev 01)
#00:15.7 0604: 15ad:07a0 (rev 01)
#03:00.0 0c03: 15ad:0779


echo "vifo new_id"
#echo "15ad 0790" > /sys/bus/pci/drivers/vfio-pci/new_id
for i in "15ad 07a0" "15ad 0779"
do
    echo $i
    echo $i > /sys/bus/pci/drivers/vfio-pci/new_id
done 


for i in  $BUS_SET
do
    echo "========$i================"
    lspci -nnDvs $i 
    echo "========$i================"
	echo
done
