#/bin/bash

/usr/libexec/qemu-kvm -name guest=centos7-virt-install-cpu,debug-threads=on \
-M pc \
-machine accel=kvm \
-cpu qemu64 \
-m 4096 -overcommit mem-lock=off \
-smp 8,sockets=2,dies=1,cores=2,threads=2 \
-numa node,nodeid=0,cpus=0-3,mem=2048 \
-numa node,nodeid=1,cpus=4-7,mem=2048 \
-uuid 4eb18a63-892d-4604-8d4f-6d6fee09cb6a \
-vnc 0.0.0.0:7 -k en-us
