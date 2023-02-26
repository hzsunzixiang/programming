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



* make 一下 

* make rel

* make run

(hello_release@127.0.0.1)1> application:which_applications().
[{runtime_tools,"RUNTIME_TOOLS","1.19"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {hello_release,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]


# 这种方式不是很好用，很难下载下来
BUILD_DEPS += bbmustache relx
dep_bbmustache = hex 1.12.2
dep_relx = hex 4.7.0
