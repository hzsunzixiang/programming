nine9s
=====

An OTP application

Build
-----

    $ rebar3 compile

这个工程是正常的

% 低版本编译
git checkout 0.1.0
rebar3 compile && rebar3 release
%% 切换到 高版本
git checkout 0.2.0
python3 upgrade.py

