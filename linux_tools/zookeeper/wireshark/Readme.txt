
# Apache ZAB—Zookeeper Atomic Broadcast Protocol
https://www.ixiacom.com/company/blog/apache-zab%E2%80%94zookeeper-atomic-broadcast-protocol
# github zab.lu
https://github.com/hzsunzixiang/ATI/tree/master/Apps/Wireshark%20Dissectors


# 如何安装
https://yoursunny.com/t/2008/Wireshark-Lua-dissector/

Wireshark虽然嵌入了Lua解释器，但是默认情况下并没有打开。安装Lua插件的方法是：

打开Wireshark安装目录的init.lua文件，搜索disable_lua(找到disable_lua = true; do return end;)，在这一行的开头添加--符号。
将Lua插件复制到Wireshark安装目录内
在init.lua的最后调用你的Lua插件：dofile('*文件名*.lua');

dofile('F:\\zookeeper\\zab.lua')
