virt-install  --import \
	--name=centos7-virt-install \
	--vcpus=2 \
	--memory 2048 \
	--disk path=/vm/centos7hda_from_qemu  \
	--console pty,target_type=virtio \
	--graphics vnc,listen=0.0.0.0 




#--console
#    Connect a text console between the guest and host. Certain guest and hypervisor combinations can automatically set up a getty in the guest, so
#    an out of the box text login can be provided (target_type=xen for xen paravirt guests, and possibly target_type=virtio in the future).
#
#    Example:
#
#    --console pty,target.type=virtio
#        Connect a virtio console to the guest, redirected to a PTY on the host.  For supported guests, this exposes /dev/hvc0 in the guest. See
#        https://fedoraproject.org/wiki/Features/VirtioSerial for more info. virtio console requires libvirt 0.8.3 or later.
#
#    Use --console=? to see a list of all available sub options. Complete details at <https://libvirt.org/formatdomain.html#elementsCharConsole>

    <controller type='virtio-serial' index='0'>
      <alias name='virtio-serial0'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x05' function='0x0'/>
    </controller>
    <console type='pty' tty='/dev/pts/14'>
      <source path='/dev/pts/14'/>
      <target type='virtio' port='0'/>
      <alias name='console0'/>
    </console>
