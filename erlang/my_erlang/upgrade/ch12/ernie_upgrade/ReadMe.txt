
%% 必须得有 sys.config

否则无法启动


ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release (master)$ bash -x bin/start
......
+ /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/bin/run_erl -daemon /tmp/ /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/log 'exec /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/bin/start_erl /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases/start_erl.data'

节选一下:
'exec /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/bin/start_erl /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases/start_erl.data'

然后用这个命令实验
ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release (master)$ /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/bin/start_erl /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases/start_erl.data
heart_beat_kill_pid = 74524
{"could not start kernel pid",application_controller,"error in config file \"/home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases/1.0/sys.config\" (none): configuration file not found"}
could not start kernel pid (application_controller) (error in config file "/home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release/releases/1.0/sys.config" (none): configuration file not found)
heart: Sun Dec 11 10:14:44 2022: Erlang is crashing .. (waiting for crash dump file)
heart: Sun Dec 11 10:14:44 2022: Would reboot. Terminating.

%% 直接运行
erl -pa coffee-1.0/ebin -boot coffee-1.0

%%%
ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12/ernie/coffee-1.0_release (master)$ erl -pa lib/coffee-1.0/ebin/ -boot releases/1.0/start
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Machine:Rebooted Hardware
Display:Make Your Selection
Eshell V13.0.4  (abort with ^G)
1> application:which_applications().
[{coffee,"Coffee Machine Controller","1.0"},
 {erts,"ERTS  CXC 138 10","13.0.4"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]

