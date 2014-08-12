#!/bin/bash

qemu-img create -f qcow2 /tmp/centos-6.4.qcow2 10G


virt-install --virt-type kvm --name centos-6.4-1 --ram 1024 \
    --cdrom=/tmp/CentOS-6.4-x86_64-minimal.iso \
--disk /tmp/centos-6.4.qcow2,format=qcow2 \
--graphics vnc,listen=0.0.0.0 --noautoconsole \
--os-type=linux --os-variant=rhel6
