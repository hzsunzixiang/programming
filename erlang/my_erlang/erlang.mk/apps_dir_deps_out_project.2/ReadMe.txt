
有几个要点：

1. FORCE_REBUILD
   rabbitmq-components.mk中

2.APPS_DIR
 APPS_DIR := $(CURDIR)/apps
 deps/myproject/Makefile中 
 
======================================================

模拟RabbitMQ的代码结构: 最外层没有代码

wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap 


* 添加外部依赖 myproject 
  手工创建 deps/myproject

* 自动初始化工程 Makefile
  ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/apps_dir_deps_out_project/deps/myproject (master)$ make -f ../../erlang.mk bootstrap



* 修改 deps/myproject 里面的Makefile:替换 include 路径
  #include erlang.mk
  include ../../erlang.mk

* 外层 添加依赖
  DPES = myproject 
  这时候 make 就能把 所依赖的部分也进行了编译

* 添加 一个 第二层的依赖   等依赖声明，放到 rabbitmq-components.mk
  但是不会真正的下载依赖，这个留到实际的业务中

   include rabbitmq-components.mk

* 添加一个  依赖组件 到第二层的Makefile

  DEPS = recon 

  这个在哪一层编译，deps就放在哪一层

* 再往下加一层 apps

  # make new-app in=webchat
  ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/apps_dir_deps_out_project/deps/rabbit (master)$ make -f ../../erlang.mk new-app in=webchat

* 加一个依赖 
  到现在为止, 最顶层，无法编译 apps这一层
  就因为一个拼写问题，找了两天时间

  DEPS = myproject
  错拼写成了 DPES
  还有一个关键点 是这里: APPS_DIR := $(CURDIR)/apps  
  find -name Makefile |xargs grep APPS_DIR
  ./deps/myproject/apps/webchat/Makefile:APPS_DIR ?= ..
  ./deps/myproject/Makefile:APPS_DIR := $(CURDIR)/apps

* 到此顺利 启动

ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/apps_dir_deps_out_project (master)$ erl -pa ./ebin ./deps/myproject/apps/webchat/ebin ./deps/myproject/ebin
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:ensure_all_started(myproject).
{ok,[webchat,myproject]}
2> application:which_applications().
[{myproject,"New project","0.1.0"},
 {webchat,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]

* make run 是不生效的，因为没有release

* 继续填充文件

The DEP_PLUGINS line tells the build system to load the plugins Cowboy provides. These include predefined templates that we will use soon.
DEP_PLUGINS = cowboy

* 继续
Open the src/hello_release_cowboy_sup.erl file and add the necessary code to the start/2 function to make it look like this:

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
	webchat_sup:start_link().

* 继续
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/apps_dir_deps_out_project.2/deps/myproject (master)$ make new t=cowboy.http n=hello_handler in=webchat

这时候的文件是空的，因为缺乏指令  


* 在添加了 如下指令， 在最外层编译，然后执行 make new t=cowboy.http n=hello_handler in=webchat 还是不行

如果不行，无非就是在各个Makefile 中添加
DEPS = cowboy
dep_cowboy_commit = 2.7.0
DEP_PLUGINS = cowboy


ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/apps_dir_deps_out_project.2/deps/myproject (master)$ make new t=cowboy.http n=hello_handler in=webchat


* 替换内容
init(Req0, State) ->
    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello Erlang!">>,
        Req0),
    {ok, Req, State}.


















