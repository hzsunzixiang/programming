#/bin/bash

/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc -m 2048 \
-smp cores=2,threads=2,sockets=2,dies=2 \
-boot c \
--blockdev raw,node-name=q1,file.driver=file,file.filename=/vm/centos7hda_from_qemu \
--device ide-hd,drive=q1 \
-netdev bridge,br=virbr0,id=n4 -device virtio-net,netdev=n4 \
-vnc 0.0.0.0:7 -k en-us



#-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]
#    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs are supported. On Sparc32 target, Linux limits the number of usable CPUs
#    to 4.  For the PC target, the number of cores per die, the number of threads per cores, the number of dies per packages and the total number of
#    sockets can be specified. Missing values will be computed.  If any on the three values is given, the total number of CPUs n can be omitted.
#    maxcpus specifies the maximum number of hotpluggable CPUs.

