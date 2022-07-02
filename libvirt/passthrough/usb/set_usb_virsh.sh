#!/bin/bash
for i in pci_0000_03_00_0 pci_0000_00_15_0 pci_0000_00_15_1 pci_0000_00_15_2 pci_0000_00_15_3 pci_0000_00_15_4 pci_0000_00_15_5 pci_0000_00_15_6 pci_0000_00_15_7

do
    virsh nodedev-detach $i
done


