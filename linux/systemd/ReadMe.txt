https://www.fosslinux.com/111815/a-guide-to-creating-linux-services-with-systemd.htm
/usr/local/bin/Hello_FOSSLinux.sh
/etc/systemd/system/FOSSLinux.service

$ sudo systemctl daemon-reload
$ sudo systemctl start FOSSLinux.service


ericksun@centos7-mq1:~/programming/linux/systemd (master)$ sudo systemctl status systemd-udevd.service                                                 [1/223]
● systemd-udevd.service - udev Kernel Device Manager
   Loaded: loaded (/usr/lib/systemd/system/systemd-udevd.service; static; vendor preset: disabled)
   Active: active (running) since Wed 2023-09-13 05:25:05 EDT; 2 weeks 3 days ago
     Docs: man:systemd-udevd.service(8)
           man:udev(7)
 Main PID: 560 (systemd-udevd)
   Status: "Processing with 16 children at max"
    Tasks: 1
   CGroup: /system.slice/systemd-udevd.service
           └─560 /usr/lib/systemd/systemd-udevd

Sep 13 05:25:05 centos7-mq1 systemd[1]: Starting udev Kernel Device Manager...
Sep 13 05:25:05 centos7-mq1 systemd-udevd[560]: starting version 219
Sep 13 05:25:05 centos7-mq1 systemd[1]: Started udev Kernel Device Manager.
Sep 13 05:25:06 centos7-mq1 mtp-probe[583]: checking bus 2, device 2: "/sys/devices/pci0000:00/0000:00:11.0/0000:02:00.0/usb2/2-1"
Sep 13 05:25:06 centos7-mq1 mtp-probe[583]: bus: 2, device: 2 was not an MTP device
ericksun@centos7-mq1:~/programming/linux/systemd (master)$ systemctl status crond.service
● crond.service - Command Scheduler
   Loaded: loaded (/usr/lib/systemd/system/crond.service; enabled; vendor preset: enabled)
   Active: active (running) since Wed 2023-09-13 05:25:19 EDT; 2 weeks 3 days ago
 Main PID: 1103 (crond)
    Tasks: 1
   CGroup: /system.slice/crond.service
           └─1103 /usr/sbin/crond -n
ericksun@centos7-mq1:~/programming/linux/systemd (master)$ sudo systemctl status NetworkManager.service
● NetworkManager.service - Network Manager
   Loaded: loaded (/usr/lib/systemd/system/NetworkManager.service; enabled; vendor preset: enabled)
   Active: active (running) since Wed 2023-09-13 05:25:18 EDT; 2 weeks 3 days ago
     Docs: man:NetworkManager(8)
 Main PID: 805 (NetworkManager)
    Tasks: 4
   CGroup: /system.slice/NetworkManager.service
           ├─   805 /usr/sbin/NetworkManager --no-daemon
           └─121643 /sbin/dhclient -d -q -sf /usr/libexec/nm-dhcp-helper -pf /var/run/dhclient-ens33.pid -lf /var/lib/NetworkManager/dhclient-9dad8126-0f18...

Sep 30 10:54:16 centos7-mq1 dhclient[121643]: DHCPREQUEST on ens33 to 255.255.255.255 port 67 (xid=0x6ba178e8)
Sep 30 10:54:16 centos7-mq1 dhclient[121643]: DHCPACK from 192.168.142.254 (xid=0x6ba178e8)
Sep 30 10:54:16 centos7-mq1 NetworkManager[805]: <info>  [1696085656.5423] dhcp4 (ens33):   address 192.168.142.137
Sep 30 10:54:16 centos7-mq1 NetworkManager[805]: <info>  [1696085656.5424] dhcp4 (ens33):   plen 24 (255.255.255.0)
Sep 30 10:54:16 centos7-mq1 NetworkManager[805]: <info>  [1696085656.5425] dhcp4 (ens33):   gateway 192.168.142.2
Sep 30 10:54:16 centos7-mq1 NetworkManager[805]: <info>  [1696085656.5425] dhcp4 (ens33):   lease time 5529540
Sep 30 10:54:16 centos7-mq1 NetworkManager[805]: <info>  [1696085656.5425] dhcp4 (ens33):   nameserver '192.168.142.2'
Sep 30 10:54:16 centos7-mq1 NetworkManager[805]: <info>  [1696085656.5426] dhcp4 (ens33):   domain name 'localdomain'
Sep 30 10:54:16 centos7-mq1 NetworkManager[805]: <info>  [1696085656.5426] dhcp4 (ens33): state changed unknown -> bound
Sep 30 10:54:16 centos7-mq1 dhclient[121643]: bound to 192.168.142.137 -- renewal in 2644791 seconds.

