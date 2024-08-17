#!/bin/bash

rm -rf deps/ src Makefile

CURRENT_DIR=$(pwd)
RABBIT_DIR=${CURRENT_DIR}/deps/rabbit
RABBIT_PRELAUNCH_DIR=${CURRENT_DIR}/deps/rabbit/apps/rabbitmq_prelaunch

{
	cd $CURRENT_DIR && make -f erlang.mk bootstrap 
	rm  -rf src
}

{ 
	mkdir -p $RABBIT_DIR && cd $RABBIT_DIR && make -f ../../erlang.mk bootstrap 
}

# 修改 deps/rabbit 里面的Makefile:替换 include 路径
#  include erlang.mk  ==>  include ../../erlang.mk
{
	sed -i 's/erlang.mk/..\/..\/erlang.mk/'  $RABBIT_DIR/Makefile
}

# 外层 添加依赖
{
    sed -i '5i DEPS = rabbit'  $CURRENT_DIR/Makefile
    sed -i '6i include rabbitmq-components.mk' $CURRENT_DIR/Makefile
}
#  这时候 make 就能把 所依赖的部分也进行了编译

#  添加一个  依赖组件 到第二层的Makefile
{
    sed -i '4i DEPS = recon'  ${RABBIT_DIR}/Makefile
    sed -i '5i include ../../rabbitmq-components.mk' ${RABBIT_DIR}/Makefile
}

# 再往下加一层 apps
{
    cd ${RABBIT_DIR} && make -f ../../erlang.mk new-app in=rabbitmq_prelaunch
}
# 加一个依赖 到现在为止, 最顶层，无法编译 apps这一层
#deps/rabbit/Makefile
{
    sed -i '4i LOCAL_DEPS = rabbitmq_prelaunch'  ${RABBIT_DIR}/Makefile
    sed -i '5i APPS_DIR := $(CURDIR)/apps' ${RABBIT_DIR}/Makefile
}
# deps/rabbit/rabbitmq_prelaunch
{
    sed -i '9i include $(ROOT_DIR)/rabbitmq-components.mk' ${RABBIT_PRELAUNCH_DIR}/Makefile
}

# 到此顺利 启动
#[ericksun@rabbitmq-1:~/rabbitmq_tutorial/rabbitmq-server-mock/rabbitmq_server]$ erl -pa ./ebin ./deps/rabbit/apps/rabbitmq_prelaunch/ebin ./deps/rabbit/ebin
#Erlang/OTP 26 [erts-14.2.5.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]
#
#Eshell V14.2.5.1 (press Ctrl+G to abort, type help(). for help)
#1> application:ensure_all_started(rabbit).
#{ok,[rabbitmq_prelaunch,rabbit]}
#2> application:which_applications().
#[{rabbit,"New project","0.1.0"},
# {rabbitmq_prelaunch,"New project","0.1.0"},
# {stdlib,"ERTS  CXC 138 10","5.2.3"},
# {kernel,"ERTS  CXC 138 10","9.2.4.1"}]
