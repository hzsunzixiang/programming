#!/bin/bash

SUFFIX=$(awk 'BEGIN { srand(); print int(1 + rand() * 10000) }')
echo $SUFFIX
DIR=/var/lib/libvirt/images ## <-- Dir to store new VM ##
VM=centos-7-$SUFFIX ## <-- set vm name ##

DIR_VM=$DIR/$VM
mkdir -vp $DIR_VM 




hostname=linuxcraft-centos7-$SUFFIX ## <-- set vm name ##
sed  's/hostname: linuxcraft-centos7/host: '"$hostname"'/g' user-data.origin > user-data


fqdn=linuxcraft-centos7-$SUFFIX.nixcraft.com
sed  -i 's/fqdn: linuxcraft-centos7.nixcraft.com/fqdn: '"$fqdn"'/g' user-data

METADATA_ISO=$VM-cidata.iso
mkisofs -o $METADATA_ISO -V cidata -J -r user-data meta-data




cp $METADATA_ISO $DIR_VM 

cp -v /root/CentOS-7-x86_64-GenericCloud.qcow2 $DIR_VM/$VM.qcow2 


# 修改密码
virt-customize -a $DIR_VM/$VM.qcow2  --root-password password:123456

cd $DIR_VM
export LIBGUESTFS_BACKEND=direct
qemu-img create -f qcow2 -o preallocation=metadata $VM.new.image 10G


virt-resize --quiet --expand /dev/sda1 $VM.qcow2 $VM.new.image
mv -v $VM.new.image $VM.qcow2

#virsh pool-create-as --name $VM --type dir --target $D/$VM


virt-install --import --name $VM \
	--memory 2048 --vcpus 2 --cpu host \
	--disk $VM.qcow2,format=qcow2,bus=virtio \
	--disk $METADATA_ISO,device=cdrom \
	--network bridge=virbr0,model=virtio \
	--os-type=linux \
	--graphics spice \
	--noautoconsole

###	--noautoconsole


# virsh net-dhcp-leases default | grep $VM | awk '{ print $5}'
