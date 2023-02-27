#mkdir ~/.bash_completion.d/
#cd ~/.bash_completion.d/
#wget -O erlang_mk https://raw.githubusercontent.com/ninenines/erlang.mk/master/etc/bash_completion
#source ~/.bash_completion


wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap bootstrap-rel


* 既然 make run 会报错
那么就指定 其版本号

BUILD_DEPS += bbmustache relx
dep_bbmustache = git https://github.com/soranoba/bbmustache.git master
     或者指定 commit_id 31e94ffd9618accd8e6604c7d5c3235363f5c5dd
dep_relx = git https://github.com/erlware/relx.git  main
     或者指定 commit_id fc931c42a4f18a9bc20064fb1d54c386463b9596


BUILD_DEPS += bbmustache relx
dep_bbmustache = git https://github.com/soranoba/bbmustache.git master
dep_relx = git https://github.com/erlware/relx.git  main


* make 一下 

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



* 增加工程文件 
  make new t=gen_server n=my_server in=webchat


* make rel

* make run

此时看到 apps 没有启动
(hello_release_apps_dir@127.0.0.1)1> application:which_applications().
[{runtime_tools,"RUNTIME_TOOLS","1.19"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {hello_release_apps_dir,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(hello_release_apps_dir@127.0.0.1)2>

而且无法启动
(hello_release_apps_dir@127.0.0.1)2> application:ensure_all_started(webchat).
{error,{webchat,{"no such file or directory",
                 "webchat.app"}}}

* Makefile中加了这一行， 就可以了LOCAL_DEPS = webchat
  apps 服务就会自动启动起来
 {webchat,"New project","0.1.0"},

(hello_release_apps_dir@127.0.0.1)1> application:which_applications().
[{runtime_tools,"RUNTIME_TOOLS","1.19"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {hello_release_apps_dir,"New project","0.1.0"},
 {webchat,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(hello_release_apps_dir@127.0.0.1)2>


