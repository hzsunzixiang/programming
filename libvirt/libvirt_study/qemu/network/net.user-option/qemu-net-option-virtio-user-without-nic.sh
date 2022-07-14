/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot d \
-drive file=/vm/centos7hda_from_qemu,if=virtio,index=0,media=disk,format=raw \
-net user \
-vnc 0.0.0.0:7 -k en-us 


# 没有 -net nic 时不会有网卡，所以这个现象没有用
# 报错： qemu-kvm: warning: hub 0 with no nics
#-net nic,model=virtio, -net user \
