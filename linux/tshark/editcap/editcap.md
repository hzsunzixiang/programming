
- capture.pcap 是从其他文件中截取的 5000 个数据包



# 通用格式 
	editcap  -d  |  -D <dup window>  |  -w <dup time window>  [ -v ] infile outfile
       
	By default, it reads all packets from the infile and writes them to the outfile in pcap file format.

# 读取若干条数据 -V 会很详细
	sudo tshark  -r network_data_origin.pcap  -c 1 -V

	sudo tshark  -r network_data_origin.pcap  -c 1
	这样可以开开始时间

#

# To delete packet 1000 from the capture file use:

   editcap capture.pcap sans1000.pcap 1000

# To limit a capture file to packets from number 200 to 750 (inclusive) use:
       -r  Reverse the packet selection.  Causes the packets whose packet numbers are specified on the command line to be written to the output capture file, instead of discarding them.

   editcap -r capture.pcap small.pcap 200-750

# To get all packets from number 1-500 (inclusive) use:

       editcap -r capture.pcap first500.pcap 1-500

   or

       editcap capture.pcap first500.pcap 501-9999999

# To exclude packets 1, 5, 10 to 20 and 30 to 40 from the new file use:

           editcap capture.pcap exclude.pcap 1 5 10-20 30-40

# To select just packets 1, 5, 10 to 20 and 30 to 40 for the new file use:

   editcap -r capture.pcap select.pcap 1 5 10-20 30-40

#  To remove duplicate packets seen within the prior four frames use:

   editcap -d capture.pcap dedup.pcap

# To remove duplicate packets seen within the prior 100 frames use:

    editcap -D 101 capture.pcap dedup.pcap

# To remove duplicate packets seen equal to or less than 1/10th of a second:

    editcap -w 0.1 capture.pcap dedup.pcap

# To display the MD5 hash for all of the packets (and NOT generate any real output file):

    editcap -v -D 0 capture.pcap /dev/null

	Packet: 4979, Len: 722, MD5 Hash: 94baa31c5d85cabee786eec037105596
	Packet: 4980, Len: 68, MD5 Hash: 9b0ce57f5ae89e6d51d17215bb9f8770
	Packet: 4981, Len: 92, MD5 Hash: 848179b1a3d0b8e050f8f46d97d99303
	Packet: 4982, Len: 68, MD5 Hash: 782ab3a77329c5ece11204ae7f23f4af
	Packet: 4983, Len: 95, MD5 Hash: 8ebd4061c1945dd18f1118cf2156ca7d
	Packet: 4984, Len: 68, MD5 Hash: 4e9961d40a917fcf63cfe8c60e5e749b


	or on Windows systems
	
	    editcap -v -D 0 capture.pcap NUL

# To advance the timestamps of each packet forward by 3.0827 seconds:

    editcap -t 3.0827 capture.pcap adjusted.pcap

# To ensure all timestamps are in strict chronological order:

    editcap -S 0 capture.pcap adjusted.pcap

# To introduce 5% random errors in a capture file use:

    editcap -E 0.05 capture.pcap capture_error.pcap

# To remove vlan tags from all packets within an Ethernet-encapsulated capture file, use:

    editcap -L -C 12:4 capture_vlan.pcap capture_no_vlan.pcap




