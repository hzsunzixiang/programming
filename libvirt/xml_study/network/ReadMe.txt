When a guest is running an interface of type network may include a portid attribute. This provides the UUID of an associated virNetworkPortPtr object that records the association between the domain interface and the network. This attribute is read-only since port objects are create and deleted automatically during startup and shutdown. Since 5.1.0



<source network='default' portid='cf10f52d-791c-41af-aede-4208b6ef768f' bridge='virbr0'/>

# e1000e的驱动方式
最简化版
    <interface type='network'>
      <source network='default' bridge='virbr0'/>
      <model type='e1000e'/>
      <alias name='net0'/>
    </interface>
更加简化的：
    <interface type='network'>
      <source network='default' bridge='virbr0'/>
      <model type='e1000e'/>
    </interface>


libvirt 会把上面这段翻译成：
<interface type="network">
  <mac address="52:54:00:7e:03:ea"/>
  <source network="default" portid="e1de23a0-e691-4a9e-a329-f4c5c542ac0e" bridge="virbr0"/>
  <target dev="vnet20"/>
  <model type="e1000e"/>
  <alias name="net0"/>
  <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
</interface>


# virtio的驱动方式

    <interface type='network'>
      <source network='default' bridge='virbr0'/>
      <model type='virtio'/>
    </interface>
libvirt 会把上面这段翻译成：

<interface type="network">
  <mac address="52:54:00:1b:78:8b"/>
  <source network="default" portid="91ee87a5-d4e0-470d-b518-ad0bebb62d58" bridge="virbr0"/>
  <target dev="vnet23"/>
  <model type="virtio"/>
  <alias name="net0"/>
  <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
</interface>


# isolated 网络和NAT几乎一样
只是所在的网桥不一样，而网桥上的iptables规则不一样，所以isolated网络包不能对外通信
[root@centos-kvm-1 network]# iptables-save  |grep virbr1
-A LIBVIRT_INP -i virbr1 -p udp -m udp --dport 53 -j ACCEPT
-A LIBVIRT_INP -i virbr1 -p tcp -m tcp --dport 53 -j ACCEPT
-A LIBVIRT_INP -i virbr1 -p udp -m udp --dport 67 -j ACCEPT
-A LIBVIRT_INP -i virbr1 -p tcp -m tcp --dport 67 -j ACCEPT
-A LIBVIRT_OUT -o virbr1 -p udp -m udp --dport 53 -j ACCEPT
-A LIBVIRT_OUT -o virbr1 -p tcp -m tcp --dport 53 -j ACCEPT
-A LIBVIRT_OUT -o virbr1 -p udp -m udp --dport 68 -j ACCEPT
-A LIBVIRT_OUT -o virbr1 -p tcp -m tcp --dport 68 -j ACCEPT
-A LIBVIRT_FWO -i virbr1 -j REJECT --reject-with icmp-port-unreachable
-A LIBVIRT_FWI -o virbr1 -j REJECT --reject-with icmp-port-unreachable
-A LIBVIRT_FWX -i virbr1 -o virbr1 -j ACCEPT
-A LIBVIRT_PRT -o virbr1 -p udp -m udp --dport 68 -j CHECKSUM --checksum-fill
[root@centos-kvm-1 network]# iptables-save  |grep virbr0
-A LIBVIRT_INP -i virbr0 -p udp -m udp --dport 53 -j ACCEPT
-A LIBVIRT_INP -i virbr0 -p tcp -m tcp --dport 53 -j ACCEPT
-A LIBVIRT_INP -i virbr0 -p udp -m udp --dport 67 -j ACCEPT
-A LIBVIRT_INP -i virbr0 -p tcp -m tcp --dport 67 -j ACCEPT
-A LIBVIRT_OUT -o virbr0 -p udp -m udp --dport 53 -j ACCEPT
-A LIBVIRT_OUT -o virbr0 -p tcp -m tcp --dport 53 -j ACCEPT
-A LIBVIRT_OUT -o virbr0 -p udp -m udp --dport 68 -j ACCEPT
-A LIBVIRT_OUT -o virbr0 -p tcp -m tcp --dport 68 -j ACCEPT
-A LIBVIRT_FWO -s 192.168.122.0/24 -i virbr0 -j ACCEPT
-A LIBVIRT_FWO -i virbr0 -j REJECT --reject-with icmp-port-unreachable
-A LIBVIRT_FWI -d 192.168.122.0/24 -o virbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A LIBVIRT_FWI -o virbr0 -j REJECT --reject-with icmp-port-unreachable
-A LIBVIRT_FWX -i virbr0 -o virbr0 -j ACCEPT
-A LIBVIRT_PRT -o virbr0 -p udp -m udp --dport 68 -j CHECKSUM --checksum-fill

    <interface type='network'>
      <source network='network1' bridge='virbr1'/>
      <model type='virtio'/>
    </interface>
define之后，内存中如下：
    <interface type='network'>
      <mac address='52:54:00:91:3b:6e'/>
      <source network='network1' portid='8ac49525-3a03-47b6-b7d7-d9154351999d' bridge='virbr1'/>
      <target dev='vnet27'/>
      <model type='virtio'/>
      <alias name='net0'/>
      <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
    </interface>
