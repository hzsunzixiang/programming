


VM_NAME=centos-7-simple

virsh stop $VM_NAME
virsh destroy $VM_NAME
virsh undefine $VM_NAME
