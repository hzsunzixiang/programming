#/bin/bash

/usr/libexec/qemu-kvm -name "centos_qemu_test" -machine accel=kvm -M pc \
-m 4096 \
-boot c \
-smp cores=2,threads=2,sockets=2,dies=2 \
-object memory-backend-ram,id=ram-node0,size=1G,host-nodes=0,policy=preferred -numa node,nodeid=0,cpus=0-3,memdev=ram-node0 \
-object memory-backend-ram,id=ram-node1,size=1G,host-nodes=0,policy=bind -numa node,nodeid=1,cpus=4-7,memdev=ram-node1 \
-object memory-backend-ram,id=ram-node2,size=1G,host-nodes=0,policy=bind -numa node,nodeid=2,cpus=8-11,memdev=ram-node2 \
-object memory-backend-ram,id=ram-node3,size=1G,host-nodes=0,policy=bind -numa node,nodeid=3,cpus=12-15,memdev=ram-node3 \
--blockdev raw,node-name=q1,file.driver=file,file.filename=/vm/centos7hda_from_qemu \
--device ide-hd,drive=q1 \
-netdev bridge,br=virbr0,id=n4 -device virtio-net,netdev=n4 \
-vnc 0.0.0.0:7 -k en-us

# qemu-kvm的manual手册上: The host-nodes option binds the memory range to a list of NUMA host nodes.
#
#The host-nodes option binds the memory range to a list of NUMA host nodes.
#The policy option sets the NUMA policy to one of the following values:
#default
#    default host policy
#preferred
#    prefer the given host node list for allocation
#bind
#    restrict memory allocation to the given host node list
#interleave
#    interleave memory allocations across the given host node list


#libvirt: Attribute mode is either 'interleave', 'strict', 'preferred', or 'restrictive', defaults to 'strict'. 
#qemu:    interleave bind preferred 

# qemu-kvm: total memory for NUMA nodes (0xff400000) should equal RAM size (0x100000000)
##-smp 16,sockets=2,dies=1,cores=4,threads=2 
#-object memory-backend-ram,id=ram-node0,size=1070596096,host-nodes=0,policy=preferred -numa node,nodeid=0,cpus=0-3,memdev=ram-node0 \
#-object memory-backend-ram,id=ram-node1,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=1,cpus=4-7,memdev=ram-node1 \
#-object memory-backend-ram,id=ram-node2,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=2,cpus=8-11,memdev=ram-node2 \ 
#-object memory-backend-ram,id=ram-node3,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=3,cpus=12-15,memdev=ram-node3

#-object memory-backend-ram,id=ram-node0,size=1070596096,host-nodes=0,policy=preferred -numa node,nodeid=0,cpus=0-3,memdev=ram-node0 \
#-object memory-backend-ram,id=ram-node1,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=1,cpus=4-7,memdev=ram-node1 \
#-object memory-backend-ram,id=ram-node2,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=2,cpus=8-11,memdev=ram-node2 \
#-object memory-backend-ram,id=ram-node3,size=1070596096,host-nodes=0,policy=bind -numa node,nodeid=3,cpus=12-15,memdev=ram-node3 \

#-object memory-backend-ram,size=2G,id=m0 \
#-object memory-backend-ram,size=2G,id=m1 \
#-numa node,nodeid=0,memdev=m0,initiator=0 \
#-numa node,nodeid=1,memdev=m1,initiator=1 \
#-numa cpu,node-id=0,socket-id=0 \
#-numa cpu,node-id=1,socket-id=1 \
#
#
#
#-numa node,nodeid=0,cpus=0-3,mem=2048 \
#-numa node,nodeid=1,cpus=4-7,mem=2048 \

#-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]
#    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs are supported. On Sparc32 target, Linux limits the number of usable CPUs
#    to 4.  For the PC target, the number of cores per die, the number of threads per cores, the number of dies per packages and the total number of
#    sockets can be specified. Missing values will be computed.  If any on the three values is given, the total number of CPUs n can be omitted.
#    maxcpus specifies the maximum number of hotpluggable CPUs.

