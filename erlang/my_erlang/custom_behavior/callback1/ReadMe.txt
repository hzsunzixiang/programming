
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

