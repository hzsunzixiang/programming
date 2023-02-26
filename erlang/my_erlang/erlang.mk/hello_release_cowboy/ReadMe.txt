#mkdir ~/.bash_completion.d/
#cd ~/.bash_completion.d/
#wget -O erlang_mk https://raw.githubusercontent.com/ninenines/erlang.mk/master/etc/bash_completion
#source ~/.bash_completion

# https://ninenines.eu/docs/en/cowboy/2.7/guide/getting_started/
wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap bootstrap-rel


* 既然 make run 会报错
那么就指定 其版本号

BUILD_DEPS += bbmustache relx
dep_bbmustache = git https://github.com/soranoba/bbmustache.git master
     或者指定 commit_id 31e94ffd9618accd8e6604c7d5c3235363f5c5dd
dep_relx = git https://github.com/erlware/relx.git  main
     或者指定 commit_id fc931c42a4f18a9bc20064fb1d54c386463b9596



* make run

ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_release_cowboy (master)$ make run
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
	(hello_release_cowboy@127.0.0.1)1>

(hello_release_cowboy@127.0.0.1)1> application:which_applications().
[{runtime_tools,"RUNTIME_TOOLS","1.19"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {hello_release_cowboy,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]

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
	hello_release_cowboy_sup:start_link().
* 继续
 make new t=cowboy.http n=hello_handler

* make run  一下 

Eshell V13.0.4  (abort with ^G)
	(hello_release_cowboy@127.0.0.1)1>


* make rel


# 这种方式不是很好用，很难下载下来
BUILD_DEPS += bbmustache relx
dep_bbmustache = hex 1.12.2
dep_relx = hex 4.7.0
