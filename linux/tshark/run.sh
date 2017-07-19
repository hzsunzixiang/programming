#sudo tshark -t a -r download.pcap -qz io,stat,1| awk -F'|' '$0 !~ /Time/' '{if(NF==5) print $0}'
sudo tshark -t a -r download.pcap -qz io,stat,1| awk -F'|' '$2 !~ /Time/  {if(NF==5) print $0}' > xx.txt
