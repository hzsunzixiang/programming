#!/bin/bash
shopt -s nullglob
for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nnDs ${d##*/})"
    done;
done;


#find /sys/kernel/iommu_groups/ -type l  | sort --version-sort
#find /sys/kernel/iommu_groups/ -type l  | sort -V

