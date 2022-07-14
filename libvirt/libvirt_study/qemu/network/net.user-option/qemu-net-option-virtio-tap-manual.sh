

# first build tap0
ip tuntap del tap0 mode tap
ip tuntap add tap0 mode tap
brctl addif virbr0 tap0
# run 
/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot d \
-drive file=/vm/centos7hda_from_qemu,if=virtio,index=0,media=disk,format=raw \
-net nic,model=virtio \
-net tap,ifname=tap0,script=no,downscript=no  \
-vnc 0.0.0.0:7 -k en-us 


