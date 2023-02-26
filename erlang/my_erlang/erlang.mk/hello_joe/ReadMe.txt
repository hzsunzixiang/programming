wget https://erlang.mk/erlang.mk
mkdir ~/.bash_completion.d/
cd ~/.bash_completion.d/
wget -O erlang_mk https://raw.githubusercontent.com/ninenines/erlang.mk/master/etc/bash_completion
source ~/.bash_completion
make -f erlang.mk bootstrap
