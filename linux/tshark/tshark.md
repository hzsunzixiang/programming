
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
		
# 协议信息  不能加 -q选项 

   Note that the -z proto option is different - it doesn't cause statistics to be gathered and printed when the capture is complete, it modifies the regular packet summary
           output to include the values of fields specified with the option.  Therefore you must not use the -q option, as that option would suppress the printing of the regular packet
           summary output, and must also not use the -V option, as that would cause packet detail information rather than packet summary information to be printed.

	root@debian:/home/stephensun/programming/linux/tshark/tcpdump# sudo tshark -r fin-ack.pcap       -z proto,colinfo,ip,ip
	1   0.000000    127.0.0.1 -> 127.0.0.1    TCP 56 12027→48697 [FIN, ACK] Seq=1 Ack=1 Win=6 Len=0  ip
	2   0.020990    127.0.0.1 -> 127.0.0.1    TCP 56 12018→37861 [FIN, ACK] Seq=1 Ack=1 Win=6 Len=0  ip
	3   0.024873    127.0.0.1 -> 127.0.0.1    TCP 56 12018→37863 [FIN, ACK] Seq=1 Ack=1 Win=6 Len=0  ip
	
	root@debian:/home/stephensun/programming/linux/tshark/tcpdump# sudo tshark -r fin-ack.pcap      -z proto,colinfo,tcp.window_size,tcp.window_size
	1   0.000000    127.0.0.1 -> 127.0.0.1    TCP 56 12027→48697 [FIN, ACK] Seq=1 Ack=1 Win=6 Len=0  tcp.window_size == 6
	2   0.020990    127.0.0.1 -> 127.0.0.1    TCP 56 12018→37861 [FIN, ACK] Seq=1 Ack=1 Win=6 Len=0  tcp.window_size == 6
	3   0.024873    127.0.0.1 -> 127.0.0.1    TCP 56 12018→37863 [FIN, ACK] Seq=1 Ack=1 Win=6 Len=0  tcp.window_size == 6

	stephensun@debian:~/programming/linux/tshark/tcpdump$ sudo tshark -r all-package.0707.3.server.pcap      -z proto,colinfo,tcp.window_size,tcp.window_size|head
	1   0.000000    127.0.0.1 -> 127.0.0.1    TCP 67 59459→12015 [PSH, ACK] Seq=1 Ack=1 Win=53 Len=13  tcp.window_size == 53
	2   0.000509    127.0.0.1 -> 127.0.0.1    TCP 67 61746→12016 [PSH, ACK] Seq=1 Ack=1 Win=97 Len=13  tcp.window_size == 97
	3   0.000557    127.0.0.1 -> 127.0.0.1    TCP 67 12016→61746 [PSH, ACK] Seq=1 Ack=14 Win=9 Len=13  tcp.window_size == 9
	4   0.000583    127.0.0.1 -> 127.0.0.1    TCP 54 61746→12016 [ACK] Seq=14 Ack=14 Win=97 Len=0  tcp.window_size == 97

	stephensun@debian:~/programming/linux/tshark/tcpdump$ sudo tshark -r all-package.0707.3.server.pcap      -z proto,colinfo,frame.time_relative,frame.time_relative |head
	1   0.000000    127.0.0.1 -> 127.0.0.1    TCP 67 59459→12015 [PSH, ACK] Seq=1 Ack=1 Win=53 Len=13  frame.time_relative == 0.000000000
	2   0.000509    127.0.0.1 -> 127.0.0.1    TCP 67 61746→12016 [PSH, ACK] Seq=1 Ack=1 Win=97 Len=13  frame.time_relative == 0.000509000
	3   0.000557    127.0.0.1 -> 127.0.0.1    TCP 67 12016→61746 [PSH, ACK] Seq=1 Ack=14 Win=9 Len=13  frame.time_relative == 0.000557000

	## 打印多列 然后用awk来处理 
	stephensun@debian:~/programming/linux/tshark/tcpdump$ tshark -r all-package.0707.2.server.pcap       -z proto,colinfo,tcp.ack,tcp.ack -z proto,colinfo,tcp.window_size,tcp.window_size   -z proto,colinfo,frame.time_relative,frame.time_relative |head
	1   0.000000    127.0.0.1 -> 127.0.0.1    TCP 113 49948→12018 [PSH, ACK] Seq=1 Ack=1 Win=97 Len=59  frame.time_relative == 0.000000000  tcp.window_size == 97  tcp.ack == 1
	2   0.000088    127.0.0.1 -> 127.0.0.1    TCP 105 12018→25528 [PSH, ACK] Seq=1 Ack=1 Win=9 Len=51  frame.time_relative == 0.000088000  tcp.window_size == 9  tcp.ack == 1
	3   0.000105    127.0.0.1 -> 127.0.0.1    TCP 54 25528→12018 [ACK] Seq=1 Ack=52 Win=97 Len=0  frame.time_relative == 0.000105000  tcp.window_size == 97  tcp.ack == 52
	## 加上过滤条件  必须引号, 不满足过滤条件的就不显示
	stephensun@debian:~/programming/linux/tshark/tcpdump$ tshark -r all-package.0707.2.server.pcap       -z 'proto,colinfo,tcp.ack,tcp.ack' -z 'proto,colinfo,tcp.window_size&&(tcp.srcport==49948),tcp.window_size'   -z 'proto,colinfo,frame.time_relative,frame.time_relative' |head
	1   0.000000    127.0.0.1 -> 127.0.0.1    TCP 113 49948→12018 [PSH, ACK] Seq=1 Ack=1 Win=97 Len=59  frame.time_relative == 0.000000000  tcp.window_size == 97  tcp.ack == 1
	2   0.000088    127.0.0.1 -> 127.0.0.1    TCP 105 12018→25528 [PSH, ACK] Seq=1 Ack=1 Win=9 Len=51  frame.time_relative == 0.000088000  tcp.ack == 1
	3   0.000105    127.0.0.1 -> 127.0.0.1    TCP 54 25528→12018 [ACK] Seq=1 Ack=52 Win=97 Len=0  frame.time_relative == 0.000105000  tcp.ack == 52
	
# capinfos	  man 还有更多信息  对应wireshark中的 统计-tcp流形图中各项功能
	stephensun@debian:~/programming/linux/tshark/tcpdump$ capinfos all-package.0707.1.pcap
	File name:           all-package.0707.1.pcap
	File type:           Wireshark/tcpdump/... - pcap
	File encapsulation:  Linux cooked-mode capture
	Packet size limit:   file hdr: 96 bytes
	Packet size limit:   inferred: 96 bytes
	Number of packets:   84 k
	File size:           7385 kB
	Data size:           8150 kB
	Capture duration:    17 seconds
	Start time:          Thu Jul  7 18:15:23 2016
	End time:            Thu Jul  7 18:15:40 2016
	Data byte rate:      466 kBps
	Data bit rate:       3735 kbps
	Average packet size: 96.98 bytes
	Average packet rate: 4814 packets/sec
	SHA1:                7cf7c1996a315811dfb37c34dddaedf35cbe888a
	RIPEMD160:           e204a1d8bc7fcc7c9d366b068247d632ac160186
	MD5:                 37e07934c4792acec5c132fa05c31022
	Strict time order:   False
	
# editcap
	http://www.thegeekstuff.com/2009/02/editcap-guide-11-examples-to-handle-network-packet-dumps-effectively/