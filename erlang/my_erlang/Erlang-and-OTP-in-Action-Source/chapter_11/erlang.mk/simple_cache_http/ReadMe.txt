

* 
wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap 


ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_http (master)$ tree
.
├── erlang.mk
├── Makefile
├── ReadMe.txt
└── src
    ├── simple_cache_http_app.erl
    └── simple_cache_http_sup.erl

src 目录可以不用，直接删了

ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_http (master)$ rm src/ -rf


* 添加外部依赖 
  手工创建 mkdir -p deps/http_interface


ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_http (master)$ tree
.
├── erlang.mk
├── Makefile
├── ReadMe.txt
└── src
    ├── simple_cache_http_app.erl
	    └── simple_cache_http_sup.erl

* 自动初始化工程 Makefile
ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_http/deps/http_interface (master)$ make -f ../../erlang.mk bootstrap

* 修改 deps/myproject 里面的Makefile:替换 include 路径
  #include erlang.mk
  include ../../erlang.mk

* 再依次添加其他两个工程
ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_http/deps/gen_web_server (master)$ make
-f ../../erlang.mk bootstrap


ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_http/deps/resource_discovery (master)$ make -f ../../erlang.mk bootstrap

ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_http/deps/simple_cache (master)$ make -f
 ../../erlang.mk bootstrap

* 把文件拷贝进来, 删除一些不必要的自动生成的文件

