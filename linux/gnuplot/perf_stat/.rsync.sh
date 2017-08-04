rsync -avz -e "ssh -p3600"  --exclude '*.pcap'  --exclude '.git' StephenSun@192.168.97.2:~/tcpdump/performance .
