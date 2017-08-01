sudo tshark -t a -r download.pcap -qz io,stat,1| awk -F'|' '$2 !~ /Time/  {if(NF==5) print $0}' > network_data.txt 
