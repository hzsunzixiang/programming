[ericksun@centos-rdma-1:~/workspace/programming/network/netlink/netlink_kernel/example_arm_2025] (master %)$ uname -r
5.14.0-565.el9.aarch64
[ericksun@centos-rdma-1:~/workspace/programming/network/netlink/netlink_kernel/example_arm_2025] (master %)$ uname -a
Linux centos-rdma-1 5.14.0-565.el9.aarch64 #1 SMP PREEMPT_DYNAMIC Fri Feb 7 19:15:30 UTC 2025 aarch64 aarch64 aarch64 GNU/Linux
[ericksun@centos-rdma-1:~/workspace/programming/network/netlink/netlink_kernel/example_arm_2025] (master %)$ echo /lib/modules/$(uname -r)/build
/lib/modules/5.14.0-565.el9.aarch64/build



netlink.h 有两个，一个内核的，一个是用户态的
