qemu-kvm  -m 2048 -hda /vm/centos-7-simple-from-qemu.qcow2 -vnc 0.0.0.0:7 
# qemu-kvm  -m 2048 -hda /vm/centos-7-simple-from-qemu.qcow2 -monitor stdio -vnc 0.0.0.0:7 

#       -monitor dev
#           Redirect the monitor to host device dev (same devices as the serial port).  The default device is "vc" in graphical mode and "stdio" in non
#           graphical mode.  Use "-monitor none" to disable the default monitor.
