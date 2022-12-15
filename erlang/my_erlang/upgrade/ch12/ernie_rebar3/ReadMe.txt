master分支 不用

% 旧版本
git checkout 1.0
rebar3 compile && rebar3 release
% 新版本 
git checkout 1.1
python3 upgrade.py




%% 更新前后
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:30]

Machine:Rebooted Hardware
Display:Make Your Selection
Eshell V13.0.4  (abort with ^G)
(coffee@centos7-dev)1>
(coffee@centos7-dev)1>
(coffee@centos7-dev)1> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {coffee,"Coffee Machine Controller","1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(coffee@centos7-dev)2>
(coffee@centos7-dev)2> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {coffee,"Coffee Machine Controller","1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(coffee@centos7-dev)3> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {coffee,"Coffee Machine Controller","1.1"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(coffee@centos7-dev)4>

