#mkdir ~/.bash_completion.d/
#cd ~/.bash_completion.d/
#wget -O erlang_mk https://raw.githubusercontent.com/ninenines/erlang.mk/master/etc/bash_completion
#source ~/.bash_completion


wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap


* 如果没有 添加 bootstrap-rel  则没有 BUILD_DEPS += relx 

* 添加外部依赖 cowboy

make 
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out (master)$ tree  -L 2
.
├── deps
│   ├── cowboy
│   ├── cowlib
│   └── ranch
├── ebin
│   ├── hello_apps_dir_deps_out.app
│   ├── hello_apps_dir_deps_out_app.beam
│   └── hello_apps_dir_deps_out_sup.beam
├── erlang.mk
├── hello_apps_dir_deps_out.d
├── Makefile
├── ReadMe.txt
└── src
    ├── hello_apps_dir_deps_out_app.erl
	    └── hello_apps_dir_deps_out_sup.erl


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

2 directories, 3 files

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

* 运行

ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_erlang_apps_dir (master)$ erl -pa ebin/ apps/webchat/ebin/
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]


* 此时依赖无法启动
2> application:ensure_all_started(hello_apps_dir_deps_out).
{error,{cowboy,{"no such file or directory","cowboy.app"}}}
3> application:ensure_all_started(webchat).
{error,{cowboy,{"no such file or directory","cowboy.app"}}}


* 需要添加更多的路径 
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out (master)$ find -name ebin
./deps/cowboy/ebin
./deps/cowlib/ebin
./deps/ranch/ebin
./ebin
./apps/webchat/ebin

此时成功了
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out (master)$ erl -pa ebin/ apps/webchat/ebin/ ./deps/cowboy/ebin ./deps/clib/ebin ./deps/ranch/ebin
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:ensure_all_started(hello_apps_dir_deps_out).
{ok,[crypto,cowlib,asn1,public_key,ssl,ranch,cowboy,webchat,
     hello_apps_dir_deps_out]}

2> application:which_applications().
[{hello_apps_dir_deps_out,"New project","0.1.0"},
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



ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out (master)$ make list-deps
erlang.mk:30: Please upgrade to GNU Make 4 or later: https://erlang.mk/guide/installation.html
make[1]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/apps/webchat'
make[2]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/cowboy'
make[3]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/cowlib'
make[3]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/cowlib'
make[3]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/ranch'
make[3]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/ranch'
make[2]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/cowboy'
make[1]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/apps/webchat'
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/apps/webchat
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/cowboy
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/cowlib
/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_apps_dir_deps_out/deps/ranch


