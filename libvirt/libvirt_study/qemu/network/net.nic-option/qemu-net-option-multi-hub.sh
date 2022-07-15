
#  看起来是不 work ，可能 方式变化过
# https://www.qemu.org/2018/05/31/nic-parameter/
/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot d \
-drive file=/vm/centos7hda_from_qemu,if=virtio,index=0,media=disk,format=raw \
-net nic,model=e1000,vlan=0 -net user,vlan=0 \
-net nic,model=virtio,vlan=1 -net tap,vlan=1 \
-vnc 0.0.0.0:7 -k en-us 
# -vga std  
#-net nic,model=virtio, -net user \
#-net nic,model=virtio \
