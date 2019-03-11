ericksun@debian-4:~/programming/linux/icmp_tun$ python C2.py
Traceback (most recent call last):
  File "C2.py", line 3, in <module>
    from scapy.all import *
ImportError: No module named scapy.all







ericksun@debian-4:~/programming/linux/icmp_tun$ sudo aptitude install  python3-pip
sudo pip3 --proxy web-proxy.tencent.com:8080 install scapy
