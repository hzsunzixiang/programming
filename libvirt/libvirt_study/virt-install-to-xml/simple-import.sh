virt-install  --import \
	--name=centos7-virt-install \
	--vcpus=2 \
	--memory=1024 \
	--disk path=/vm/centos7hda_from_qemu  \
	--graphics vnc,listen=0.0.0.0 \
	--print-xml  --dry-run

