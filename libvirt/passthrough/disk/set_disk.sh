#!/bin/bash
for i in pci_0000_02_00_0 pci_0000_02_01_0 pci_0000_02_02_0 pci_0000_02_04_0 pci_0000_02_05_0
do
    virsh nodedev-detach $i
done


