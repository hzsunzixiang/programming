
ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12/ernie_upgrade/coffee-1.0_release (master)$ bin/to_erl
Attaching to /tmp/erlang.pipe.1 (^D to exit)

1> application:which_applications().
[{coffee,"Coffee Machine Controller","1.0"},
 {erts,"ERTS  CXC 138 10","13.0.4"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
2> release_handler:unpack_release("coffee-1.1").
{ok,"1.1"}
3> release_handler:install_release("1.1").
code_change('1.0', selection, [], {}).{ok,"1.0",[]}

%% 升级成功之后 relup 文件被修改了
4> coffee_fsm:cancel().
ok
5> coffee_fsm:open().
Display:Open
ok
%% 这里调用的就是1.1版本了
6> coffee_fsm:close().
ok
Machine:Rebooted Hardware
Display:Make Your Selection
7> application:which_applications().
[{coffee,"Coffee Machine Controller","1.1"},
 {erts,"ERTS  CXC 138 10","13.0.4"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
8> init:restart().
ok
9> Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

% 这里重启之后恢复了原来的版本
Machine:Rebooted Hardware
Display:Make Your Selection
Eshell V13.0.4  (abort with ^G)
1> application:which_applications().
[{coffee,"Coffee Machine Controller","1.0"},
 {erts,"ERTS  CXC 138 10","13.0.4"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]

%  这里重新安装一次
2> release_handler:install_release("1.1").
code_change('1.0', selection, [], {}).{ok,"1.0",[]}
3> application:which_applications().
[{coffee,"Coffee Machine Controller","1.1"},
 {erts,"ERTS  CXC 138 10","13.0.4"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
% 这里进行了持久化
4> release_handler:make_permanent("1.1").
ok

% 这里查看版本信息
5> release_handler:which_releases().
[{"coffee","1.1",
  ["kernel-8.4.2","stdlib-4.0.1","sasl-4.2","erts-13.0.4",
   "coffee-1.1"],
  permanent},
 {"coffee","1.0",[],old}]

