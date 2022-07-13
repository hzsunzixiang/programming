virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install.2 \
--boot=hd \
--debug \
--vcpus=2 \
--memory=1024 \
--cdrom /root/CentOS-7-x86_64-Minimal-2009.iso \
--disk path=/dev/sdc \
--network network=default \
--graphics vnc,listen=0.0.0.0 


# 用这种方式 先把数据写到 /dev/sdc
# 然后 dd到文件中 
# [root@centos-kvm-1 vm]# dd if=/dev/sdc of=cento-7-from-dev.raw
# 20971520+0 records in
# 20971520+0 records out
# 10737418240 bytes (11 GB, 10 GiB) copied, 35.9818 s, 298 MB/s


