virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install-cdrom  \
--boot=hd \
--debug \
--vcpus=2 \
--memory=1024 \
--disk path=/vm/centos7-virt-install \
--disk /root/CentOS-7-x86_64-Minimal-2009.iso \
--network network=default \
--graphics vnc,listen=0.0.0.0 

