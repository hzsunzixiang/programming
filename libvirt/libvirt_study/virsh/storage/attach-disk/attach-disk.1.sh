virsh attach-disk centos7-virt-install-cpu \
--source /vm/centos7-vm-disk1-512M \
--target vdb \
--persistent


#virsh detach-disk centos7-virt-install-cpu vdb --persistent
#virsh attach-disk centos7-virt-install-cpu \
#/vm/centos7-vm-disk1-512M \
#vdb \
#--cache none

#attach-disk
# Syntax:
#
#    attach-disk domain source target [[[--live] [--config] |
#       [--current]] | [--persistent]] [--targetbus bus]
#       [--driver driver] [--subdriver subdriver] [--iothread iothread]
#       [--cache cache] [--io io] [--type type] [--alias alias]
#       [--mode mode] [--sourcetype sourcetype] [--serial serial]
#       [--wwn wwn] [--rawio] [--address address] [--multifunction]
#       [--print-xml]
#
# Attach  a  new  disk  device  to  the  domain.  source is path for the files and devices. target controls the bus or device under which the disk is
# exposed to the guest OS. It indicates the "logical" device name; the optional targetbus attribute specifies the type of  disk  device  to  emulate;
# possible  values are driver specific, with typical values being ide, scsi, virtio, xen, usb, sata, or sd, if omitted, the bus type is inferred from
# the style of the device name (e.g.  a device named 'sda' will typically be exported using a SCSI bus).  driver can be file, tap or phy for the  Xen
# hypervisor  depending  on  the kind of access; or qemu for the QEMU emulator.  Further details to the driver can be passed using subdriver. For Xen
# subdriver can be aio, while for QEMU subdriver should match the format of the disk source, such as raw or qcow2.  Hypervisor default will  be  used
# if  subdriver is not specified.  However, the default may not be correct, esp. for QEMU as for security reasons it is configured not to detect disk
# formats.  type can indicate lun, cdrom or floppy as alternative to the disk default, although this use only replaces the media within the  existing
# virtual  cdrom or floppy device; consider using update-device for this usage instead.  alias can set user supplied alias.  mode can specify the two
# specific mode readonly or shareable.   sourcetype  can  indicate  the  type  of  source  (block|file)  cache  can  be  one  of  "default",  "none",
# "writethrough", "writeback", "directsync" or "unsafe".  io controls specific policies on I/O; QEMU guests support "threads" and "native".  iothread
# is the number within the range of domain IOThreads to which this disk may be attached (QEMU only).  serial is the serial of disk device. wwn is the
# wwn   of   disk   device.   rawio  indicates  the  disk  needs  rawio  capability.   address  is  the  address  of  disk  device  in  the  form  of
# pci:domain.bus.slot.function, scsi:controller.bus.unit, ide:controller.bus.unit, usb:bus.port,  sata:controller.bus.unit  or  ccw:cssid.ssid.devno.
# Virtio-ccw devices must have their cssid set to 0xfe.  multifunction indicates specified pci address is a multifunction pci device address.
#
# If --print-xml is specified, then the XML of the disk that would be attached is printed instead.
#
# If --live is specified, affect a running domain.  If --config is specified, affect the next startup of a persistent domain.  If --current is speci‐
#    fied, affect the current domain state.  Both --live and --config flags may be given, but --current is exclusive. When no flag is  specified  legacy
#    API is used whose behavior depends on the hypervisor driver.
#
#    For  compatibility  purposes,  --persistent  behaves like --config for an offline domain, and like --live --config for a running domain.  Likewise,
#    --shareable is an alias for --mode shareable.

