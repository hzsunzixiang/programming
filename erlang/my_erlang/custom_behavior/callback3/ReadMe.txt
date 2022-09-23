

# 不加 -spec 已经可以检测出来了
  同时也可以加上 -spec

故意错误
-spec get_happy() -> {'ok', Reply :: term(), 'stop', another}.
get_happy() -> {ok, hello, stop}.



ericksun@centos7-dev:~/programming/erlang/my_erlang/custom_behavior/callback3 (master)$ dialyzer *.erl
  Checking whether the PLT /home/ericksun/.cache/erlang/.dialyzer_plt is up-to-date... yes
  Proceeding with analysis...
my_module.erl:16:2: The return type
          {'ok', _, 'stop', 'another'} in the specification of get_happy/0 is not a subtype of
          {'ok', _, 'stop'}, which is the expected return type for the callback of the gen_happy behaviour
my_module.erl:16:2: Invalid type specification for function my_module:get_happy/0. The success typing is
          () -> {'ok', 'hello', 'stop'}
 done in 0m0.23s
done (warnings were emitted)




# dialyzer 检测
ericksun@centos7-dev:~/programming/erlang/my_erlang/custom_behavior/callback2 (master)$ dialyzer *.erl
  Checking whether the PLT /home/ericksun/.cache/erlang/.dialyzer_plt is up-to-date... yes
  Proceeding with analysis...
my_module.erl:16:1: The inferred return type of get_happy/0
         ({[32 | 33 | 89 | 97 | 109 | 110 | 111 | 112 | 114 | 121, ...],
           'stop', 'hello'}) has nothing in common with
          {'ok', _, 'stop'}, which is the expected return type for the callback of the gen_happy behaviour
 done in 0m0.28s
done (warnings were emitted)



# 演示callback的使用方式， 不使用  behaviour_info

The callback functions of the module can be specified either directly by the exported function behaviour_info/1:

behaviour_info(callbacks) -> Callbacks.
or by a -callback attribute for each callback function:

-callback Name(Arguments) -> Result.



#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

https://erlangbyexample.org/custom-behaviours

# 如果不添加 -pa ./ 的编译路径则会报错

  my_module.erl:2:2: Warning: behaviour gen_happy undefined
  %    2| -behavior(gen_happy).
  %     |  ^


  这样会把必要的警告信息忽略过去了

# 如果加上 -pa ./ 的编译路径, 在缺少声明回调的时候，会给出警告提示

erlc -W -pa ./ gen_happy.erl
erlc -W -pa ./ my_module.erl
my_module.erl:2:2: Warning: undefined callback function get_ecstatic/0 (behaviour 'gen_happy')
%    2| -behavior(gen_happy).
%     |  ^


