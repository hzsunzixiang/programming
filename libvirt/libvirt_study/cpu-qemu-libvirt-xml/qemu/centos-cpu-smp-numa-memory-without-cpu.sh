#/bin/bash

/usr/libexec/qemu-kvm -name "centos_qemu_test" -M pc \
-boot c \
-machine accel=kvm \
-machine hmat=on \
-m 4G,slots=2,maxmem=8G \
-object memory-backend-ram,size=2G,id=m0 \
-object memory-backend-ram,size=2G,id=m1 \
-numa node,nodeid=0,memdev=m0 \
-numa node,nodeid=1,memdev=m1,initiator=0 \
-smp cores=2,threads=2,sockets=2,dies=2 \
-numa cpu,node-id=0,socket-id=0 \
-numa cpu,node-id=0,socket-id=1 \
--blockdev raw,node-name=q1,file.driver=file,file.filename=/vm/centos7hda_from_qemu \
--device ide-hd,drive=q1 \
-netdev bridge,br=virbr0,id=n4 -device virtio-net,netdev=n4 \
-vnc 0.0.0.0:7 -k en-us


#initiator 都为0， nuam1上没有cpu 
#-numa node,nodeid=0,memdev=m0,initiator=0 \
#-numa node,nodeid=1,memdev=m1,initiator=0 \
#qemu-kvm: -numa cpu,node-id=1,socket-id=1: The initiator of CPU NUMA node 1 should be itself
# 这里也要改
#-numa cpu,node-id=0,socket-id=1 \


# -machine hmat=on \
#[root@centos-kvm-1 cpu-qemu-libvirt-xml]# bash centos-cpu-smp-numa-memory.sh
#qemu-kvm: -numa node,nodeid=1,memdev=m1,initiator=0: ACPI Heterogeneous Memory Attribute Table (HMAT) is disabled, enable it with -machine hmat=on before using any of hmat specific options
#


#-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]
#    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs are supported. On Sparc32 target, Linux limits the number of usable CPUs
#    to 4.  For the PC target, the number of cores per die, the number of threads per cores, the number of dies per packages and the total number of
#    sockets can be specified. Missing values will be computed.  If any on the three values is given, the total number of CPUs n can be omitted.
#    maxcpus specifies the maximum number of hotpluggable CPUs.

#-machine hmat=on \
#-m 2G,slots=2,maxmem=4G \
#-object memory-backend-ram,size=1G,id=m0 \
#-object memory-backend-ram,size=1G,id=m1 \
#-numa node,nodeid=0,memdev=m0 \
#-numa node,nodeid=1,memdev=m1,initiator=0 \
#-smp 2,sockets=2,maxcpus=2  \
#-numa cpu,node-id=0,socket-id=0 \
#-numa cpu,node-id=0,socket-id=1

#-m [size=]megs[,slots=n,maxmem=size]
#    Sets guest startup RAM size to megs megabytes. Default is 128 MiB.  Optionally, a suffix of "M" or "G" can be used to signify a value in
#    megabytes or gigabytes respectively. Optional pair slots, maxmem could be used to set amount of hotpluggable memory slots and maximum amount of
#    memory. Note that maxmem must be aligned to the page size.
#
#    For example, the following command-line sets the guest startup RAM size to 1GB, creates 3 slots to hotplug additional memory and sets the
#    maximum memory the guest can reach to 4GB:
#
#            qemu-kvm -m 1G,slots=3,maxmem=4G
#
#    If slots and maxmem are not specified, memory hotplug won't be enabled and the guest startup RAM will never increase.

