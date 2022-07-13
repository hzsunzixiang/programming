virt-install  --import \
--connect qemu:///system \
--name=centos7-virt-install.1 \
--boot=hd \
--debug \
--vcpus=2 \
--memory=1024 \
--cdrom /root/CentOS-7-x86_64-Minimal-2009.iso \
--disk path=/vm/centos7-virt-install \
--network network=default \
--graphics vnc,listen=0.0.0.0 


#  --location my-unknown.iso
#[root@centos-kvm-1 vm]# qemu-img  create /vm/centos7-virt-install 10G
#Formatting '/vm/centos7-virt-install', fmt=raw size=10737418240


#[Wed, 13 Jul 2022 04:07:11 virt-install 8106] DEBUG (cli:395) Launching virt-viewer for graphics type 'vnc'
#[Wed, 13 Jul 2022 04:07:11 virt-install 8106] DEBUG (cli:370) Running: virt-viewer --connect qemu:///system --wait centos7-virt-install.1

