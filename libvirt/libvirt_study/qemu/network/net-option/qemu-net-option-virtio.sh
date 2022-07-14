/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot d \
-drive file=/vm/centos7hda_from_qemu,if=virtio,index=0,media=disk,format=raw \
-net nic,model=virtio \
-vnc 0.0.0.0:7 -k en-us 
# -vga std  
#-net nic,model=virtio, -net user \
