
#  erl -name 'apple@centos1.com' -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369 -setcookie test
#  erl -name 'blackberry@centos1.com' -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369 -setcookie test



erl - The Erlang emulator.
  -Application Par Val:
   Sets the application configuration parameter Par to the value Val for the application Application; see app(5) and application(3erl).


# https://www.erlang.org/doc/design_principles/applications.html
All applications that must be started before this application is started. systools uses this list to generate correct boot scripts. Defaults to []. Notice that all applications have dependencies to at least Kernel and STDLIB.

ericksun@centos-2:~/programming$ erl
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Eshell V12.2  (abort with ^G)
	1> application:loaded_applications().
	[{stdlib,"ERTS  CXC 138 10","3.17"},
	 {kernel,"ERTS  CXC 138 10","8.2"}]



kernel - The Kernel application.
         {inet_dist_listen_min, First} and {inet_dist_listen_max, Last}:
           Defines the First..Last port range for the listener socket of a distributed Erlang node.

# 这是因为cookie不匹配
(pinapple@centos2.com)1> =ERROR REPORT==== 30-Dec-2021::05:01:51.955508 ===
** Connection attempt from node 'blackberry@centos1.com' rejected. Invalid challenge reply. **

=ERROR REPORT==== 30-Dec-2021::05:02:20.646513 ===
** Connection attempt from node 'blackberry@centos1.com' rejected. Invalid challenge reply. **

=ERROR REPORT==== 30-Dec-2021::05:02:36.450760 ===
** Connection attempt from node 'blackberry@centos1.com' rejected. Invalid challenge reply. **

=ERROR REPORT==== 30-Dec-2021::05:02:39.052267 ===
** Connection attempt from node 'blackberry@centos1.com' rejected. Invalid challenge reply. **


(blackberry@centos1.com)13> net_kernel:connect_node('pinapple@centos2.com').
true
(blackberry@centos1.com)14> nodes().
['pinapple@centos2.com']
(blackberry@centos1.com)15> erlang:disconnect_node('pinapple@centos2.com').   # 断开
true
(blackberry@centos1.com)16> nodes().
[]

# 运行一例
```
ericksun@centos-1:~/programming/erlang/my_erlang$ erl -name blackberry@centos1.com -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Eshell V12.2  (abort with ^G)
(blackberry@centos1.com)1> net_kernel:connect_node('pinapple@centos2.com').
true
(blackberry@centos1.com)2> nodes().
['pinapple@centos2.com']
(blackberry@centos1.com)3> node().
'blackberry@centos1.com'
(blackberry@centos1.com)4> net_kernel:connect_node('pinapple@centos2.com').
true
(blackberry@centos1.com)5> nodes()
(blackberry@centos1.com)5> .
['pinapple@centos2.com']
(blackberry@centos1.com)6> net_kernel:connect_node('pinapple@centos2.com').
true
(blackberry@centos1.com)7> nodes().
['pinapple@centos2.com']
(blackberry@centos1.com)8>
BREAK: (a)bort (A)bort with dump (c)ontinue (p)roc info (i)nfo
       (l)oaded (v)ersion (k)ill (D)b-tables (d)istribution
```

# 断开
```
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Eshell V12.2  (abort with ^G)
(blackberry@centos1.com)1> net_kernel:connect_node('pinapple@centos2.com').
true
(blackberry@centos1.com)2>
(blackberry@centos1.com)2>
(blackberry@centos1.com)2>
(blackberry@centos1.com)2> nodes().
['pinapple@centos2.com']
(blackberry@centos1.com)3> erlang:disconnect_node('pinapple@centos2.com').  # 断开的时候是FIN报文
true
(blackberry@centos1.com)4> nodes().
[]
(blackberry@centos1.com)5> node().
'blackberry@centos1.com'
(blackberry@centos1.com)6> net_kernel:connect_node('pinapple@centos2.com').
true
(blackberry@centos1.com)7>

```



# erl_epmd:names() 会产生网络通信，请求本机 4369 端口
```
(blackberry@centos1.com)7> erl_epmd:names().
{ok,[{"blackberry",6369}]}
(blackberry@centos1.com)11> net_adm:names().
{ok,[{"blackberry",6369}]}

(blackberry@centos1.com)31> erl_epmd:names("centos2.com").
{ok,[{"pinapple",6869},{"watermelon",6870}]}
(blackberry@centos1.com)32> net_adm:names("centos2.com").
{ok,[{"pinapple",6869},{"watermelon",6870}]}


Frame 6: 71 bytes on wire (568 bits), 71 bytes captured (568 bits)
Linux cooked capture v1
Internet Protocol Version 4, Src: 192.168.142.135, Dst: 192.168.142.135
Transmission Control Protocol, Src Port: 50044, Dst Port: 4369, Seq: 1, Ack: 1, Len: 3
Erlang Port Mapper Daemon
    Length: 1
    Type: EPMD_NAMES_REQ (110)

等价于命令行
ericksun@centos-1:~$ epmd -names
epmd: up and running on port 4369 with data:
name watermelon at port 6370
name blackberry at port 6369

也可以加参数，指定相应机器，如果不在同一个机器上，则会tcp连接请求
(blackberry@centos1.com)26> erl_epmd:names("centos2.com").
{ok,[{"pinapple",6869},{"watermelon",6870}]}
(blackberry@centos1.com)27> erl_epmd:names("centos2.com").
{ok,[{"pinapple",6869},{"watermelon",6870}]}
(blackberry@centos1.com)28> erl_epmd:names("centos1.com").
{ok,[{"blackberry",6369},{"watermelon",6370}]}


```




nodes(). 操作不会产生网络通信
```
(blackberry@centos1.com)11> nodes().
['watermelon@centos2.com','pinapple@centos2.com']
```

erl  -name blackberry -remsh watermelon@centos2.com

-remsh Node:
  Starts Erlang with a remote shell connected to Node.

-rsh Program:
  Specifies an alternative to rsh for starting a slave node on a remote host; see slave(3erl).

# 登录成功
ericksun@centos-1:~/programming/erlang/programming_erlang$ erl  -name blackberry@centos1.com  -remsh watermelon@centos2.com
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Eshell V12.2  (abort with ^G)
(watermelon@centos2.com)1>

ericksun@centos-1:~$ ps aux|grep beam
ericksun   18087  0.4  1.0 2521500 39148 pts/2   Sl+  22:13   0:00 /usr/lib64/erlang/erts-12.2/bin/beam.smp -- -root /usr/lib64/erlang -progname erl -- -home /home/ericksun -- -name blackberry@centos1.com -remsh watermelon@centos2.com



# ssh

https://www.erlang.org/doc/apps/ssh/using_ssh.html



======================================
要使用stop功能，epmd必须以 -relaxed_command_check 启动，具体参考epmd –help
演示下：

view sourceprint?
$ erl -sname x -epmd "epmd -relaxed_command_check -daemon"
Erlang R14B04 (erts-5.8.5)  [64-bit] [smp:16:16] [rq:16] [async-threads:0] [hipe] [kernel-poll:false]
 
Eshell V5.8.5  (abort with ^G)
(x@my031089)1>
 
$ epmd -names
epmd: up and running on port 4369 with data:
name x at port 58953
$ epmd -stop x
STOPPED
$ epmd -names
epmd: up and running on port 4369 with data:


					https://www.cnblogs.com/me-sa/p/erlang-epmd.html
https://blog.csdn.net/zuimrs/article/details/104690404

https://my.oschina.net/moooofly/blog/533594

最完善的英文版协议
 https://www.erlang.org/doc/apps/erts/erl_dist_protocol.html
  
  
  https://book.hacktricks.xyz/pentesting/4369-pentesting-erlang-port-mapper-daemon-epmd
  	
https://insinuator.net/2017/10/erlang-distribution-rce-and-a-cookie-bruteforcer/
	
	
127.0.1.1       apple@debian-1
127.0.1.1       orange@debian-1
127.0.1.1       pear@debian-1


erl -name apple@`debian-1` -kernel inet_dist_listen_min 6000 inet_dist_listen_max 6050 -setcookie testcookie

erl -sname apple@`debian-2` -kernel inet_dist_listen_min 6000 inet_dist_listen_max 6050 -setcookie testcookie


net_kernel:connect_node('apple2@debian-2').
net_kernel:connect_node('apple@debian-1').
net_kernel:start(['apple@debian-2']).


(apple@debian-1)8> erl_epmd:names().
{ok,[{"rabbit",25672},{"orange",40205},{"apple",6000}]}



net_kernel:connect_node('apple2@debian2').

net_kernel:connect_node('apple1@debian1').

allow(['apple2@debian2'])

rabbitmq 必须这样重启，否则一直启动
 service rabbitmq-server stop


erl -cookie YOURLEAKEDCOOKIE -sname test2

erl -cookie YOURLEAKEDCOOKIE -sname test2 -remsh apple2@debian2

erl  -sname test2 -remsh apple2@debian2


======================
erl -sname apple1 -setcookie CKYBWKWCWNLSPZWSLJXT -remsh apple2@debian2


erl -sname apple2@debian2 -setcookie CKYBWKWCWNLSPZWSLJXT

====================

erl -sname apple -setcookie CKYBWKWCWNLSPZWSLJXT 

erl -sname orange -setcookie CKYBWKWCWNLSPZWSLJXT 


erl -sname pear -setcookie CKYBWKWCWNLSPZWSLJXT 
erl -sname test -setcookie CKYBWKWCWNLSPZWSLJXT -remsh 'apple@centos-1'


sudo firewall-cmd --permanent --add-port=33797/tcp
sudo firewall-cmd --permanent --add-port=38265/tcp

sudo firewall-cmd --reload

https://www.tecmint.com/fix-no-route-to-host-ssh-error-in-linux/


## Distributed node port range
  node.dist_listen_min = 6369
  node.dist_listen_max = 7369

  firewall-cmd --add-port=6000-8000/tcp --permanent
  erl -sname apple@centos_1 -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369 -setcookie CKYBWKWCWNLSPZWSLJXT
  erl -sname pear@centos_2 -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369 -setcookie CKYBWKWCWNLSPZWSLJXT
  erl -sname apple -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369 -setcookie test
  erl -sname orange -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369 -setcookie test


  [pid  6307] writev(0, [{iov_base="net_kernel:connect_node('pear@centos-2').", iov_len=41}], 1) = 41
  [pid  6307] writev(22, [{iov_base="\0\0\0\17", iov_len=4}, {iov_base="\0\0\0\2\1\1centos-2\0", iov_len=15}], 2) = 19


  firewall-cmd --add-port=3000-8000/tcp --permanent

  firewall-cmd --reload
  ========
  erl -name 'apple@centos1.com' -kernel inet_dist_listen_min 6369 inet_dist_listen_max 7369 -setcookie test




# 必须是原子 atom 不能是字符串
(pear@centos7-dev)1> net_kernel:connect_node("apple@centos7-dev").
** exception error: no function clause matching net_kernel:connect_node("apple@centos7-dev") (net_kernel.erl, line 333)
(pear@centos7-dev)2> net_kernel:connect_node('apple@centos7-dev').
true

