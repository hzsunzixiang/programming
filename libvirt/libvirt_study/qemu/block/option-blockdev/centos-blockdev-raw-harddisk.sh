#/bin/bash

/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 768 \
-smp 2 -boot c \
--blockdev raw,node-name=q1,file.driver=file,file.filename=/vm/centos7hda_from_qemu \
--device ide-hd,drive=q1 \
--blockdev raw,node-name=q2,file.driver=host_device,file.filename=/dev/sdc \
--device ide-hd,drive=q2 \
-netdev bridge,br=virbr0,id=n4 -device virtio-net,netdev=n4 \
-vnc 0.0.0.0:7 -k en-us


# 本地磁盘正确的方式是 host_device

#https://git.qemu.org/?p=qemu.git;a=commit;h=230ff73904e72dde2d7718c2da407786a1c72e57
#https://unix.stackexchange.com/questions/551407/passing-a-block-device-to-qemu
