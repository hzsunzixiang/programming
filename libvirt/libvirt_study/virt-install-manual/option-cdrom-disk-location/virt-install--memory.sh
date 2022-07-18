virt-install  --import \
	--name=centos7-virt-install \
	--vcpus=2 \
	--memory currentMemory=1024,maxMemory=2048 \
	--disk path=/vm/centos7hda_from_qemu  \
	--graphics vnc,listen=0.0.0.0 \
	--print-xml  --dry-run

