





stephensun@debian:~/tcpdump$ tshark  -r 'chamdiv_00196_20160721115250'  -z io,stat,1





# 协议统计  Protocol Hierarchy Statistics  -- 对应wireshark  统计-协议分级

	只能跟一个过滤器
	-z io,phs[,filter]

	## 所有包统计
	stephensun@debian:~/tcpdump$ sudo tshark  -r 'chamdiv_00196_20160721115250'  -qz io,phs


      ===================================================================
      Protocol Hierarchy Statistics
      Filter:
      
      sll                                      frames:10000 bytes:834886
        ip                                     frames:10000 bytes:834886
          tcp                                  frames:10000 bytes:834886
            data                               frames:4977 bytes:492926
      ===================================================================
    ## 用过滤器统计
	stephensun@debian:~/tcpdump$ sudo tshark  -r 'chamdiv_00196_20160721115250'  -qz io,phs,ip.addr==192.168.202.92
	
	===================================================================
	Protocol Hierarchy Statistics
	Filter: ip.addr==192.168.202.92
	
	sll                                      frames:10000 bytes:834886
	  ip                                     frames:10000 bytes:834886
		tcp                                  frames:10000 bytes:834886
		  data                               frames:4977 bytes:492926
	===================================================================
	


# 数据统计  相当于 wireshark中的 统计- IO图表

	## 对所有的包进行统计
		stephensun@debian:~/tcpdump$ tshark  -q -r 'chamdiv_00196_20160721115250'  -z io,stat,1
		
		====================================
		| IO Statistics                    |
		|                                  |
		| Duration: 0.466 secs             |
		| Interval: 0.466 secs             |
		|                                  |
		| Col 1: Frames and bytes          |
		|----------------------------------|
		|                |1                |
		| Interval       | Frames |  Bytes |
		|----------------------------------|
		| 0.000 <> 0.466 |  10000 | 834886 |
		====================================
	## 时间间隔为0.001s
		stephensun@debian:~/tcpdump$ tshark  -q -r 'chamdiv_00196_20160721115250'  -z io,stat,.001
		
		===================================
		| IO Statistics                   |
		|                                 |
		| Duration: 0.466 secs            |
		| Interval: 0.001 secs            |
		|                                 |
		| Col 1: Frames and bytes         |
		|---------------------------------|
		|                |1               |
		| Interval       | Frames | Bytes |
		|---------------------------------|
		| 0.000 <> 0.001 |     42 |  3592 |
		| 0.001 <> 0.002 |     26 |  2107 |
		| 0.002 <> 0.003 |     47 |  3989 |
		| 0.003 <> 0.004 |     62 |  5165 |
	
	## 同时统计多个协议
		stephensun@debian:~/tcpdump$ sudo tshark  -r 'chamdiv_00196_20160721115250'  -qz io,stat,0.01,ip,tcp,smtp,pop
		
		====================================================================================
		| IO Statistics                                                                    |
		|                                                                                  |
		| Duration: 0.47 secs                                                              |
		| Interval: 0.01 secs                                                              |
		|                                                                                  |
		| Col 1: ip                                                                        |
		|     2: tcp                                                                       |
		|     3: smtp                                                                      |
		|     4: pop                                                                       |
		|----------------------------------------------------------------------------------|
		|              |1               |2               |3               |4               |
		| Interval     | Frames | Bytes | Frames | Bytes | Frames | Bytes | Frames | Bytes |
		|----------------------------------------------------------------------------------|
		| 0.00 <> 0.01 |    368 | 31360 |    368 | 31360 |      0 |     0 |      0 |     0 |
		| 0.01 <> 0.02 |    329 | 28394 |    329 | 28394 |      0 |     0 |      0 |     0 |
		| 0.02 <> 0.03 |    170 | 14693 |    170 | 14693 |      0 |     0 |      0 |     0 |
		| 0.03 <> 0.04 |    272 | 23171 |    272 | 23171 |      0 |     0 |      0 |     0 |
		| 0.04 <> 0.05 |    296 | 25433 |    296 | 25433 |      0 |     0 |      0 |     0 |
		| 0.05 <> 0.06 |    297 | 25933 |    297 | 25933 |      0 |     0 |      0 |     0 |
		
	# 其他各种过滤器
	stephensun@debian:~/tcpdump$ sudo tshark  -r 'chamdiv_00196_20160721115250'  -qz io,stat,0.01,ip.addr==192.168.202.92

	# 含有16进制 49430510的包, 间隔时间为1S
		stephensun@debian:~/tcpdump$ tshark  -q -r 'chamdiv_00196_20160721115250'  -z io,stat,1,"tcp contains 49:43:05:10"
		
		====================================
		| IO Statistics                    |
		|                                  |
		| Duration: 0.466 secs             |
		| Interval: 0.466 secs             |
		|                                  |
		| Col 1: tcp contains 49:43:05:10  |
		|----------------------------------|
		|                |1                |
		| Interval       | Frames |  Bytes |
		|----------------------------------|
		| 0.000 <> 0.466 |   1437 | 136515 |
		====================================
		

# 统计对话信息  相当于wireshark中的 统计-对话
	这个只支持一个协议，但是可以加多个过滤器
	 -z conv,type[,filter]
		The  table is sorted according to the total number of frames.


	## 统计ip信息 按ip地址统计
	
	stephensun@debian:~/tcpdump$ sudo tshark  -r 'chamdiv_00196_20160721115250'  -qz  conv,ip

    ================================================================================
    IPv4 Conversations
    Filter:<No Filter>
                                                   |       <-      | |       ->      | |     Total     |    Relative    |   Duration   |
                                                   | Frames  Bytes | | Frames  Bytes | | Frames  Bytes |      Start     |              |
    192.168.202.92       <-> 192.168.202.92          9998    834757       0         0    9998    834757     0.000000000         0.4663
    192.168.202.94       <-> 192.168.202.92             1        56       1        73       2       129     0.426984000         0.0000
    ================================================================================

	
	## 统计tcp信息，tcp是按端口统计的
		stephensun@debian:~/tcpdump$ sudo tshark  -r 'chamdiv_00196_20160721115250'  -qz  conv,tcp
		================================================================================
		TCP Conversations
		Filter:<No Filter>
													|       <-      | |       ->      | |     Total     |    Relative    |   Duration   |
													| Frames  Bytes | | Frames  Bytes | | Frames  Bytes |      Start     |              |
		192.168.202.92:31525 <-> 192.168.202.92:15653     280     23056     280     19067     560     42123     0.056920000         0.2898
		192.168.202.92:31534 <-> 192.168.202.92:15653     264     21891     264     17979     528     39870     0.162817000         0.2758
		192.168.202.92:31513 <-> 192.168.202.92:15653     251     21007     251     17095     502     38102     0.171813000         0.1091
		192.168.202.92:31541 <-> 192.168.202.92:15653      87      9932      87      5943     174     15875     0.107784000         0.1063
		192.168.202.92:31555 <-> 192.168.202.92:15653      75      6244      75      5127     150     11371     0.003373000         0.4626
	## 统计tcp信息，可以跟过滤器

		stephensun@debian:~/tcpdump$ sudo tshark  -r 'chamdiv_00196_20160721115250'  -qz  conv,tcp,ip.addr==192.168.202.92

	