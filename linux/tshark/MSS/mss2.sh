

# 拷贝一份
# cp ../editcap/capture.pcap .   

# 统计MSS净荷 总大小
# tshark   -r capture.pcap  -z io,stat,1

# In computer programming, the most common usage of the term is in the context of message protocols, to differentiate the protocol overhead from the actual data. For example, a JSON web service response might be:
# {  
# 	   "data":{  
# 		         "message":"Hello, world!"
# 					    }
# }
# The string "Hello, world!" is the payload, while the rest is protocol overhead.

#净荷 payload
#开销 overhead
#
#
#假设 overhead = ethernetHeader + ipHeader + tcpHeader
#
#计算公式 
#		sum (Bytes - Frames * overhead)
#
#	==============================
#	| IO Statistics              |
#	|                            |
#	| Duration: 7.642795 secs    |
#	| Interval: 1 secs           |
#	|                            |
#	| Col 1: Frames and bytes    |
#	|----------------------------|
#	|          |1                |
#	| Interval | Frames |  Bytes |
#	|----------------------------|
#	|  0 <> 1  |    435 | 117486 |
#	|  1 <> 2  |    644 | 181349 |
#	|  2 <> 3  |    634 | 178837 |
#	|  3 <> 4  |    637 | 176879 |
#	|  4 <> 5  |    681 | 185156 |
#	|  5 <> 6  |    812 | 196373 |
#	|  6 <> 7  |    755 | 193225 |
#	|  7 <> Dur|    402 | 100299 |
#	==============================

# 如何检测 overhead

# tshark -r capture.pcap  -c 1 -V >> mss.sh

# Frame 1: 76 bytes on wire (608 bits), 76 bytes captured (608 bits) on interface 0
# 	.....
#     Frame Length: 76 bytes (608 bits)
#     Capture Length: 76 bytes (608 bits)
# Internet Protocol Version 4, Src: 192.168.97.3 (192.168.97.3), Dst: 192.168.97.2 (192.168.97.2)
#     Version: 4
#     Header Length: 20 bytes
# Transmission Control Protocol, Src Port: 44518 (44518), Dst Port: 8610 (8610), Seq: 0, Len: 0
#     Header Length: 40 bytes


# 可以看出 开销为
# 	16 + 20 + 40 = 76

#OVERHEAD=76
##printf("network the average packets/s:%.1f\n", sum / n); 
#cat data.txt  |awk -F'|' '{print $3,$4}' |awk '
#	BEGIN{sumFrames = 0; sumBytes =0; sumPayLoad=0} 
#	{sumFrames += $1; sumBytes += $2; sumPayLoad+=$2 - '"$OVERHEAD"'*$1}
#	END {printf("sumFrames:%.1f, \nsumBytes:%.1f, \nsumPayLoad:%.1f,\nloadratio:%.4f\n", sumFrames, sumBytes, sumPayLoad, sumPayLoad/sumBytes)}
#'


####  统计 进出流量





版本不同 输出不一致 
在  1.8.10 版本上输出 如下

sudo tshark -t a -r AccessSeverTest1020_1k.process//network_data_origin.pcap -qz io,stat,1,tcp.srcport==8610,tcp.dstport==8610
Running as user "root" and group "root". This could be dangerous.

=====================================================================
| IO Statistics                                                     |
|                                                                   |
| Interval size: 1 secs                                             |
| Col 1: Frames and bytes                                           |
|     2: tcp.srcport==8610                                          |
|     3: tcp.dstport==8610                                          |
|-------------------------------------------------------------------|
|              |1                |2                |3               |
| Time         | Frames |  Bytes | Frames |  Bytes | Frames | Bytes |
|-------------------------------------------------------------------|
| 12:25:40 |   1517 | 189381 |    708 | 131898 |    809 | 57483 |
| 12:25:41 |   1474 | 173363 |    673 | 116255 |    801 | 57108 |
| 12:25:42 |   1177 | 140967 |    540 |  95571 |    637 | 45396 |
| 12:25:43 |   1126 | 134154 |    516 |  90719 |    610 | 43435 |
| 12:25:44 |   1549 | 194464 |    712 | 134828 |    837 | 59636 |
| 12:25:45 |   1536 | 173230 |    700 | 113622 |    836 | 59608 |
| 12:25:46 |   1178 | 136145 |    544 |  90993 |    634 | 45152 |
| 12:25:47 |   1609 | 197905 |    740 | 136013 |    869 | 61892 |
| 12:25:48 |   1629 | 190685 |    746 | 127761 |    883 | 62924 |



在  TShark 1.12.1 (Git Rev Unknown from unknown) 下输出

StephenSun@debian:~/programming/linux/tshark/MSS$ SPORT=8610
StephenSun@debian:~/programming/linux/tshark/MSS$ sudo tshark -t a -r capture.pcap -qz io,stat,1,tcp.srcport==$SPORT,tcp.dstport==$SPORT
tshark: Lua: Error during loading:
 [string "/usr/share/wireshark/init.lua"]:46: dofile has been disabled due to running Wireshark as superuser. See http://wiki.wireshark.org/CaptureSetup/CapturePrivileges for help in running Wireshark as an unprivileged user.
 Running as user "root" and group "stephensun". This could be dangerous.

 ===============================================
 | IO Statistics                               |
 |                                             |
 | Duration: 7.642795 secs                     |
 | Interval: 1 secs                            |
 |                                             |
 | Col 1: tcp.srcport==8610                    |
 |     2: tcp.dstport==8610                    |
 |---------------------------------------------|
 |          |1                |2               |
 | Time     | Frames |  Bytes | Frames | Bytes |
 |---------------------------------------------|
 | 09:27:47 |    208 |  98896 |    227 | 18590 |
 | 09:27:48 |    310 | 154589 |    334 | 26760 |
 | 09:27:49 |    306 | 152555 |    328 | 26282 |
 | 09:27:50 |    303 | 150179 |    334 | 26700 |
 | 09:27:51 |    326 | 157079 |    355 | 28077 |
 | 09:27:52 |    384 | 162950 |    428 | 33423 |
 | 09:27:53 |    358 | 162051 |    397 | 31174 |
 | 09:27:54 |    194 |  83824 |    208 | 16475 |
 ===============================================



