#/bin/bash

/usr/libexec/qemu-kvm -name "centos_qemu_test" \
-machine accel=kvm \
-M pc -m 2048 \
-smp 32 -boot c \
--blockdev raw,node-name=q1,file.driver=file,file.filename=/vm/centos7hda_from_qemu \
--device ide-hd,drive=q1 \
-netdev bridge,br=virbr0,id=n4 -device virtio-net,netdev=n4 \
-vnc 0.0.0.0:7 -k en-us

