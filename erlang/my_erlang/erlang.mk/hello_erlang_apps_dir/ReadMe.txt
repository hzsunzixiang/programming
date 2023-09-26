wget https://erlang.mk/erlang.mk
#mkdir ~/.bash_completion.d/
#cd ~/.bash_completion.d/
#wget -O erlang_mk https://raw.githubusercontent.com/ninenines/erlang.mk/master/etc/bash_completion
#source ~/.bash_completion
make -f erlang.mk bootstrap


● Makefile 中 去掉BUILD_DEPS += relx 
● make run 会报错


* make new-app in=webchat

Bootstrap targets:
  bootstrap          Generate a skeleton of an OTP application
  bootstrap-lib      Generate a skeleton of an OTP library
  bootstrap-rel      Generate the files needed to build a release
  new-app in=NAME    Create a new local OTP application NAME
  new-lib in=NAME    Create a new local OTP library NAME
  new t=TPL n=NAME   Generate a module NAME based on the template TPL
  new t=T n=N in=APP Generate a module NAME based on the template TPL in APP
  list-templates     List available templates



* make new t=gen_server n=my_server in=webchat


* 此时不用做任何配置，
  make的时候就能编译默认的apps目录下的工程
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_erlang_apps_dir (master)$ make
erlang.mk:30: Please upgrade to GNU Make 4 or later: https://erlang.mk/guide/installation.html
make[1]: Entering directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_erlang_apps_dir/apps/webchat'
 DEPEND webchat.d
 ERLC   webchat_app.erl webchat_sup.erl
 APP    webchat
make[1]: Leaving directory `/home/ericksun/programming/erlang/my_erlang/erlang.mk/hello_erlang_apps_dir/apps/webchat'
 DEPEND hello_erlang_apps_dir.d
 ERLC   hello_erlang_apps_dir_app.erl hello_erlang_apps_dir_sup.erl
 APP    hello_erlang_apps_dir


ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_erlang_apps_dir (master)$ tree apps/webchat/
apps/webchat/
├── ebin
│   ├── webchat.app
│   ├── webchat_app.beam
│   └── webchat_sup.beam
├── Makefile
├── src
│   ├── webchat_app.erl
│   └── webchat_sup.erl
└── webchat.d

* 运行



ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_erlang_apps_dir (master)$ erl -pa ebin/ apps/webchat/ebin/
Erlang/OTP 26 [erts-14.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V14.1 (press Ctrl+G to abort, type help(). for help)
1> application:ensure_all_started(hello_erlang_apps_dir).
{ok,[hello_erlang_apps_dir]}
2> application:which_applications().
[{hello_erlang_apps_dir,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","5.1"},
 {kernel,"ERTS  CXC 138 10","9.1"}]
3> application:ensure_all_started(webchat).
{ok,[webchat]}
4> application:which_applications().
[{webchat,"New project","0.1.0"},
 {hello_erlang_apps_dir,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","5.1"},
 {kernel,"ERTS  CXC 138 10","9.1"}]



* 此时还没有依赖
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_erlang_deps (master)$ make list-deps


