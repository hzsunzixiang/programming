

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

OVERHEAD=76
#printf("network the average packets/s:%.1f\n", sum / n); 
cat data.txt  |awk -F'|' '{print $3,$4}' |awk '
	BEGIN{sumFrames = 0; sumBytes =0; sumPayLoad=0} 
	{sumFrames += $1; sumBytes += $2; sumPayLoad=$2 - '"$OVERHEAD"'*$1}
	END {printf("sumFrames:%.1f, \nsumBytes:%.1f, \nsumPayLoad:%.1f,\nloadratio:%.1f\n", sumFrames, sumBytes, sumPayLoad, sumPayLoad/sumBytes)}
'



