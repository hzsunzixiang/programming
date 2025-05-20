[ericksun@centos-rdma-1:~/workspace/programming/rdma/socket/pingpong] (master %)$ ibv_rc_pingpong -d rxe0 -g 0  -s 4096 -n 1 -p 18515
  local address:  LID 0x0000, QPN 0x000033, PSN 0x595879, GID fe80::20c:29ff:fe9d:942
  remote address: LID 0x0000, QPN 0x00003e, PSN 0x44996e, GID fe80::20c:29ff:fe3a:d3f0
8192 bytes in 0.00 seconds = 37.97 Mbit/sec
1 iters in 0.00 seconds = 1726.00 usec/iter



[ericksun@centos-rdma-2:~/workspace/programming/rdma/socket/pingpong] (master %)$ ibv_rc_pingpong -d rxe0 -g 0 -n 1 -p 18515 172.16.117.160
  local address:  LID 0x0000, QPN 0x00003e, PSN 0x44996e, GID fe80::20c:29ff:fe3a:d3f0
  remote address: LID 0x0000, QPN 0x000033, PSN 0x595879, GID fe80::20c:29ff:fe9d:942
8192 bytes in 0.00 seconds = 46.84 Mbit/sec
1 iters in 0.00 seconds = 1399.00 usec/iter
