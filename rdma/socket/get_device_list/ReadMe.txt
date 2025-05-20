(gdb) set print pretty on
(gdb) n
961             if (!dev_list) {
(gdb) print **dev_list
$5 = {
  _ops = {
    _dummy1 = 0x0,
    _dummy2 = 0x0
  },
  node_type = IBV_NODE_CA,
  transport_type = IBV_TRANSPORT_IB,
  name = "rxe0", '\000' <repeats 59 times>,
  dev_name = "uverbs0", '\000' <repeats 56 times>,
  dev_path = "/sys/class/infiniband_verbs/uverbs0", '\000' <repeats 220 times>,
  ibdev_path = "/sys/class/infiniband/rxe0", '\000' <repeats 229 times>
}
(gdb)



[ericksun@centos-rdma-1:~/workspace/programming/rdma/socket/get_device_list] (master *+%)$ ibv_devinfo
hca_id: rxe0
        transport:                      InfiniBand (0)
        fw_ver:                         0.0.0
        node_guid:                      020c:29ff:fe9d:0942
        sys_image_guid:                 020c:29ff:fe9d:0942
        vendor_id:                      0xffffff
        vendor_part_id:                 0
        hw_ver:                         0x0
        phys_port_cnt:                  1
                port:   1
                        state:                  PORT_ACTIVE (4)
                        max_mtu:                4096 (5)
                        active_mtu:             1024 (3)
                        sm_lid:                 0
                        port_lid:               0
                        port_lmc:               0x00
                        link_layer:             Ethernet

[ericksun@centos-rdma-1:~/workspace/programming/rdma/socket/get_device_list] (master *+%)$ ibv_devices list
    device                 node GUID
    ------              ----------------
    rxe0                020c29fffe9d0942
[ericksun@centos-rdma-1:~/workspace/programming/rdma/socket/get_device_list] (master *+%)$ ibv_devices show  rxe0
    device                 node GUID
    ------              ----------------
    rxe0                020c29fffe9d0942
