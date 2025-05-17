#!/bin/bash


PCIe_NIC="0000:1a:00.0"
modprobe uio
modprobe uio_pci_generic
dpdk-devbind.py -b uio_pci_generic  $PCIe_NIC
echo 1024 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
