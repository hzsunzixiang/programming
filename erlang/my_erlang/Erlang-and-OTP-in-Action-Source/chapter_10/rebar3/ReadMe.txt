
ericksun@centos7-dev:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_10/rebar3 (master)$ rebar3 new release erlware_package desc='simple cache of erlang'
===> Writing erlware_package/apps/erlware_package/src/erlware_package_app.erl
===> Writing erlware_package/apps/erlware_package/src/erlware_package_sup.erl
===> Writing erlware_package/apps/erlware_package/src/erlware_package.app.src
===> Writing erlware_package/rebar.config
===> Writing erlware_package/config/sys.config
===> Writing erlware_package/config/vm.args
===> Writing erlware_package/.gitignore
===> Writing erlware_package/LICENSE
===> Writing erlware_package/README.md



ericksun@centos7-dev:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_10/rebar3/erlware_package/apps (master)$ rebar3 new app resource_discovery  desc 'resource discovery of erlang '
===> Writing resource_discovery/src/resource_discovery_app.erl
===> Writing resource_discovery/src/resource_discovery_sup.erl
===> Writing resource_discovery/src/resource_discovery.app.src
===> Writing resource_discovery/rebar.config
===> Writing resource_discovery/.gitignore
===> Writing resource_discovery/LICENSE
===> Writing resource_discovery/README.md


ericksun@centos7-dev:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_10/rebar3/erlware_package/apps/erlware_package/src (master)$ cp ~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_10/origin/simple_cache/src/*   .



rebar3 shell --sname mynode2 --config config/sys.config


注意， 这个缓存只是同步了数据，但是并没有放到节点上，
