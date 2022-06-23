sudo chown  ericksun:ericksun ~/programming/.git/ -R

# 镜像下载地址
https://cloud.centos.org/centos/7/images/



# cloud-init 密码
https://github.com/vmware/photon/issues/659
https://zhimin-wen.medium.com/provision-a-vm-with-cloud-image-and-cloud-init-36f356a33b90

```
users:
- name: root
lock-passwd: false
passwd: $1$SaltSalt$YhgRYajLPrYevs14poKBQ0

The above password is generated for plain-text password "secret"

root@localBoxISO [ ~ ]# openssl passwd -1 -salt SaltSalt secret
$1$SaltSalt$YhgRYajLPrYevs14poKBQ0
root@localBoxISO [ ~ ]#
```

# 可以这样修改密码
https://blog.csdn.net/rain_fan/article/details/117921340

https://www.cyberciti.biz/faq/how-to-reset-forgotten-root-password-for-linux-kvm-qcow2-image-vm/

[root@centos-kvm centos-7-7989]# guestfish

Welcome to guestfish, the guest filesystem shell for
editing virtual machine filesystems and disk images.

Type: ‘help’ for help on commands
      ‘man’ to read the manual
      ‘quit’ to quit the shell

><fs> add-ro  centos-7-7989.qcow2
><fs> run
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
><fs> list-filesystems
/dev/sda1: xfs
><fs> mount /dev/sda1 /
><fs> vim /etc/shadow
vim: unknown command
><fs> vi /etc/shadow
><fs> quit


# 修改密码正确的做法



https://serverfault.com/questions/770674/centos-7-generic-cloud-login


The default username for the CentOS 7 cloud image is centos. There is no password; instead you log in with the ssh key you provided at instance creation. You can then sudo and do whatever you like.#

virt-customize -a image_name.qcow2 --root-password password:your.great.password


# 登录
[root@centos-kvm qcow2_by_virt_manager]# virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname                 Client ID or DUID
-----------------------------------------------------------------------------------------------------------------------
 2022-06-23 10:12:53   52:54:00:11:e6:8a   ipv4       192.168.122.251/24   -                        -
 2022-06-23 10:19:58   52:54:00:1d:b3:2f   ipv4       192.168.122.40/24    -                        -
 2022-06-23 09:59:46   52:54:00:d1:0d:e6   ipv4       192.168.122.59/24    linuxcraft-centos7       -
 2022-06-23 10:23:31   52:54:00:d7:85:55   ipv4       192.168.122.210/24   linuxcraft-centos7-563   -

找到相应的ip就能登录
ssh centos@192.168.122.210



# 删除 dhcp
 https://stackoverflow.com/questions/43904012/remove-libvirts-dhcp-lease-entry-using-virsh
可以取文件里面删json
Dynamic leases are difficult to remove using virsh.

Deleting the var/lib/libvirt/dnsmasq/virbr0.* files will work for the default network. Assuming everything is off i.e. all your VMs are down

sudo rm var/lib/libvirt/dnsmasq/virbr0.*
