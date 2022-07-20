#!/bin/bash
virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-from-qcow2 \
--boot=hd \
--debug \
--memory=4096 \
--vcpus=2 \
--disk path=/vm/centos7-virt-install,device=disk,bus=virtio \
--network network=default \
--graphics vnc,listen=0.0.0.0 

