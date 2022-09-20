


#  演示 	behaviour_info(callbacks) -> Callbacks.

The callback functions of the module can be specified either directly by the exported function behaviour_info/1:

behaviour_info(callbacks) -> Callbacks.
or by a -callback attribute for each callback function:

-callback Name(Arguments) -> Result.




# 需要先编译  behavior 模块 my_server.erl
  但是直接编译， 会看到看到错误 ,这是因为没有加路径的原因
kitty_server2.erl:4:2: Warning: behaviour my_server undefined
%    4| -behavior(my_server).
%     |  ^

  因为makefile中的编译是乱序的，所以没办法保证顺序，可以手工 erlc 验证


# 加上路径 -pa ./ 之后，如果没有声明相应的回调，则会报错：
  错误如下： kitty_server2.erl:4:2: Warning: undefined callback function handle_info/2 (behaviour 'my_server')

ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/myself/kitty_server_modify_behavior (master)$ erlc -pa ./  kitty_server2.erl
kitty_server2.erl:4:2: Warning: undefined callback function handle_info/2 (behaviour 'my_server')
%    4| -behavior(my_server).
%     |  ^

kitty_server2.erl:36:48: Warning: variable 'From' is unused
%   36| handle_call({order, Name, Color, Description}, From, Cats) ->
%     |                                                ^

kitty_server2.erl:68:5: Warning: variable 'Cat5' is unused
%   68|     Cat5 = kitty_server2:order_cat(ServerPid, carl_5, brown, "loves to burn bridges"),
%     |     ^

