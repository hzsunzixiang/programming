#cd ~/.bash_completion.d/
#wget -O erlang_mk https://raw.githubusercontent.com/ninenines/erlang.mk/master/etc/bash_completion
#source ~/.bash_completion
#mkdir ~/.bash_completion.d/


wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap


* Makefile 中 去掉BUILD_DEPS += relx 
* make run 会报错


* make 一下 

erl -pa ebin/ deps/cowboy/ebin/ deps/cowlib/ebin/ deps/ranch/ebin/
1> application:ensure_all_started(hello_erlang).
{ok,[crypto,cowlib,asn1,public_key,ssl,ranch,cowboy,
     hello_erlang]}



