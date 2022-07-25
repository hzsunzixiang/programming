virt-install  --import \
    --connect qemu:///system \
	--name=centos7-virt-migrate\
	--vcpus=2 \
	--memory currentMemory=1024 \
	--disk path=/vmdata/cento-7-simple.qcow2 \
	--graphics vnc,listen=0.0.0.0 


