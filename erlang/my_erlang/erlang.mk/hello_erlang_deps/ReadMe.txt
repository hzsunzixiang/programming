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

ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_erlang_deps (master)$ tree apps/webchat/
apps/webchat/
├── ebin
│   ├── webchat.app
│   ├── webchat_app.beam
│   └── webchat_sup.beam
├── Makefile
├── src
│   ├── my_server.erl
│   ├── webchat_app.erl
│   └── webchat_sup.erl
└── webchat.d

