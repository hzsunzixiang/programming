

模拟RabbitMQ的代码结构: 最外层没有代码

wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap 



* 添加外部依赖 rabbit 
  手工创建 deps/rabbit

* 自动初始化工程 Makefile
  ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/apps_dir_deps_out_project/deps/rabbit (master)$ make -f ../../erlang.mk bootstrap


* 修改deps/rabbit 里面的Makefile:替换 include 路径
  #include erlang.mk
  include ../../erlang.mk

* 外层 添加依赖
  DPES = rabbit
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
  



  

==================================
 


* 添加 apps 
  make new-app in=webchat

Bootstrap targets:
  bootstrap          Generate a skeleton of an OTP application
  bootstrap-lib      Generate a skeleton of an OTP library
  bootstrap-rel      Generate the files needed to build a release
  new-app in=NAME    Create a new local OTP application NAME
  new-lib in=NAME    Create a new local OTP library NAME
  new t=TPL n=NAME   Generate a module NAME based on the template TPL
  new t=T n=N in=APP Generate a module NAME based on the template TPL in APP
  list-templates     List available templates

ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out (master)$ tree apps/
apps/
└── webchat
    ├── Makefile
    └── src
        ├── webchat_app.erl
        └── webchat_sup.erl

* apps中添加依赖 

DEPS = cowboy 
DEP_PLUGINS = cowboy


* make new t=gen_server n=my_server in=webchat
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out (master)$ make new t=gen_server n=my_server in=webchat
erlang.mk:30: Please upgrade to GNU Make 4 or later: https://erlang.mk/guide/installation.html
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out (master)$ tree apps/
apps/
└── webchat
    ├── Makefile
    └── src
        ├── my_server.erl
        ├── webchat_app.erl
        └── webchat_sup.erl

* 在apps中添加 位于外部的依赖

DEPS = cowboy 
DEP_PLUGINS = cowboy
* 然后添加代码

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    webchat_sup:start_link().

* 增加handler

一定要加上选项 in=XXX
make new t=cowboy.http n=hello_handler in=webchat

* 替换内容 
init(Req0, State) ->
    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello Erlang!">>,
        Req0),
    {ok, Req, State}.

* 外层添加依赖


LOCAL_DEPS = webchat

* 运行

make run

直接就能运行起来, 如果不加 LOCAL_DEPS = webchat ， 则 {webchat,"New project","0.1.0"} 无法自动启动
(hello_apps_dir_deps_out_release@127.0.0.1)1> application:which_applications().
[{runtime_tools,"RUNTIME_TOOLS","1.19"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {hello_apps_dir_deps_out_release,"New project","0.1.0"},
 {webchat,"New project","0.1.0"},
 {cowboy,"Small, fast, modern HTTP server.","2.7.0"},
 {ranch,"Socket acceptor pool for TCP protocols.","1.7.1"},
 {ssl,"Erlang/OTP SSL application","10.8.3"},
 {public_key,"Public key infrastructure","1.13"},
 {asn1,"The Erlang ASN1 compiler version 5.0.19","5.0.19"},
 {cowlib,"Support library for manipulating Web protocols.",
         "2.8.0"},
 {crypto,"CRYPTO","5.1.1"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]


* 请求

 ericksun@centos7-mq1:~/programming/erlang/my_erlang/rebar3/hellorebar3 (master)$ curl  http://localhost:8080
 Hello Erlang!


* 查看依赖

ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release (master)$  make list-deps
erlang.mk:30: Please upgrade to GNU Make 4 or later: https://erlang.mk/guide/installation.html
make[1]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/apps/webchat'
make[2]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/cowboy'
make[3]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/cowlib'
make[3]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/cowlib'
make[3]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/ranch'
make[3]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/ranch'
make[2]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/cowboy'
make[1]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/apps/webchat'
make[1]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/bbmustache'
make[1]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/bbmustache'
make[1]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/relx'
make[1]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/relx'
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/apps/webchat
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/bbmustache
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/cowboy
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/cowlib
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/ranch
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out_release/deps/relx

