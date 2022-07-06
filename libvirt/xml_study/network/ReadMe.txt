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

