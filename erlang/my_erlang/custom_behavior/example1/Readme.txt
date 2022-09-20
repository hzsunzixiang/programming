ericksun@centos7-dev:~/programming/erlang/my_erlang/custom_behavior/example1 (master)$ erlc  -pa ./ my_callbacks.erl
my_callbacks.erl:2:2: Warning: undefined callback function bar/1 (behaviour 'my_behavior')
%    2| -behavior(my_behavior).
%     |  ^

my_callbacks.erl:2:2: Warning: undefined callback function baz/2 (behaviour 'my_behavior')
%    2| -behavior(my_behavior).
%     |  ^

