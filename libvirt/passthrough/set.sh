



for i in 0000:00:11.0 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    echo "$i" > /sys/bus/pci/devices/$i/driver/unbind
done
#echo "0000:00:11.0" > /sys/bus/pci/devices/0000\:00\:11.0/driver/unbind
#echo "0000:02:00.0" > /sys/bus/pci/devices/0000\:02\:00.0/driver/unbind
#echo "0000:02:01.0" > /sys/bus/pci/devices/0000\:02\:01.0/driver/unbind
#echo "0000:02:02.0" > /sys/bus/pci/devices/0000\:02\:00.0/driver/unbind
#echo "0000:02:04.0" > /sys/bus/pci/devices/0000\:02\:04.0/driver/unbind



for i in "15ad 0790" "15ad 0774" "8086 100f" "15ad 0770" "8086 100f"
do
    echo $i
    echo $i > /sys/bus/pci/drivers/vfio-pci/new_id
done 

for i in 0000:00:11.0 0000:02:00.0 0000:02:01.0 0000:02:02.0 0000:02:04.0
do
    lspci -vs $i 
done
#echo "15ad 0790" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo "15ad 0774" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo "8086 100f" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo "15ad 0770" > /sys/bus/pci/drivers/vfio-pci/new_id
#echo "8086 100f" > /sys/bus/pci/drivers/vfio-pci/new_id



#[root@centos-kvm-1 passthrough]# lspci -ns 0000:00:11.0
#00:11.0 0604: 15ad:0790 (rev 02)
#[root@centos-kvm-1 passthrough]# lspci -ns 0000:02:00.0
#02:00.0 0c03: 15ad:0774
#[root@centos-kvm-1 passthrough]# lspci -ns 0000:02:01.0
#02:01.0 0200: 8086:100f (rev 01)
#[root@centos-kvm-1 passthrough]# lspci -ns 0000:02:02.0
#02:02.0 0c03: 15ad:0770
#[root@centos-kvm-1 passthrough]# lspci -ns 0000:02:04.0
#02:04.0 0200: 8086:100f (rev 01)

#echo "0000:02:04.0" > /sys/bus/pci/drivers/vfio-pci/bind
#echo -n "0000:02:04.0" > /sys/bus/pci/drivers/vfio-pci/bind
