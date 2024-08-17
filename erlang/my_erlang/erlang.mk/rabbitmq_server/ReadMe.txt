

# 模拟RabbitMQ的代码结构: 最外层没有代码

wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap 



#  添加外部依赖 myproject 
#  手工创建 deps/myproject

mkdir deps/rabbit

# 自动初始化工程 Makefile

cd deps/rabbit
make -f ../../erlang.mk bootstrap



# 修改 deps/rabbitmq 里面的Makefile:替换 include 路径
#  #include erlang.mk
#  include ../../erlang.mk

# 外层 添加依赖
   DPES = rabbit 
#  这时候 make 就能把 所依赖的部分也进行了编译

###################
* 添加第二层的依赖  等依赖声明，放到 rabbitmq-components.mk
  但是不会真正的下载依赖，这个留到实际的业务中

   include rabbitmq-components.mk

* 添加一个  依赖组件 到第二层的Makefile

  DEPS = recon 

  这个在哪一层编译，deps就放在哪一层

* 再往下加一层 apps

  # make new-app in=rabbitmq_prelaunch
  rabbit 目录下执行 (master)$ make -f ../../erlang.mk new-app in=rabbitmq_prelaunch

* 加一个依赖 
  到现在为止, 最顶层，无法编译 apps这一层

  DEPS = rabbitmq_prelaunch 
  还有一个关键点 是这里: APPS_DIR := $(CURDIR)/apps  

  find -name Makefile |xargs grep APPS_DIR
  ./deps/rabbit/apps/rabbitmq_prelaunch/Makefile:APPS_DIR ?= ..
  ./deps/rabbit/Makefile:APPS_DIR := $(CURDIR)/apps

* 到此顺利 启动

erl -pa ./ebin ./deps/myproject/apps/webchat/ebin ./deps/myproject/ebin
Eshell V13.0.4  (abort with ^G)
1> application:ensure_all_started(myproject).
{ok,[webchat,myproject]}
2> application:which_applications().
[{myproject,"New project","0.1.0"},
 {webchat,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]

