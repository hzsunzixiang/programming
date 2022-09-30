
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/kitty_server (master)$ erl -sname apple -setcookie test
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(apple@centos7-dev)1> kitty_gen_server_by_server_name_global:start_link()
close_shop/1   code_change/3  handle_call/3  handle_cast/2  handle_info/2
init/1         make_cat/3     module_info/0  module_info/1  order_cat/4
return_cat/2   start/0        start_link/0   terminate/2
(apple@centos7-dev)1> kitty_gen_server_by_server_name_global:start_link().
{ok,<0.89.0>}
(apple@centos7-dev)2>



因为名字是全局的，再次启动会失败, 而用global就不会
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/kitty_server (master)$ erl -sname pear -setcookie test
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(pear@centos7-dev)1> net_kernel:connect_node('apple@centos7-dev').
true
(pear@centos7-dev)2> kitty_gen_server_by_server_name_global:start_link().
{error,{already_started,<10429.89.0>}}
(pear@centos7-dev)3>


=============

改个名字就可以了
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/kitty_server (master)$ erl -sname apple -setcookie test
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(apple@centos7-dev)1> kitty_gen_server_by_server_name_global:start_link()
close_shop/1   code_change/3  handle_call/3  handle_cast/2  handle_info/2
init/1         make_cat/3     module_info/0  module_info/1  order_cat/4
return_cat/2   start/0        start_link/0   terminate/2
(apple@centos7-dev)1> kitty_gen_server_by_server_name_global:start_link().
{ok,<0.89.0>}
(apple@centos7-dev)2> global:registered_names().
[kitty_gen_server_by_server_name_global]
(apple@centos7-dev)3> global:registered_names().
[kitty_gen_server_by_server_name_global_2,
 kitty_gen_server_by_server_name_global]



Cericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/kitty_server (master)$ erl -sname pear -setcookie test
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(pear@centos7-dev)1> net_kernel:connect_node('apple@centos7-dev').
true
% 在这里改了  gen_server:start_link({global, kitty_gen_server_by_server_name_global_2}, ?MODULE, [], []).
(pear@centos7-dev)2> kitty_gen_server_by_server_name_global:start_link().   
{ok,<0.95.0>}
(pear@centos7-dev)3> global:registered_names().
[kitty_gen_server_by_server_name_global_2,
 kitty_gen_server_by_server_name_global]
(pear@centos7-dev)4> global
global           global_group     global_search
(pear@centos7-dev)4> global:whereis_name(kitty_gen_server_by_server_name_global_2).
<0.95.0>
(pear@centos7-dev)5> global:whereis_name(kitty_gen_server_by_server_name_global).
<9435.89.0>

